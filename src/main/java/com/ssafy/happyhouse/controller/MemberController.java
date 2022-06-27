package com.ssafy.happyhouse.controller;

import java.io.Reader;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.happyhouse.controller.MemberController;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	

	@Autowired
	private MemberService memberService;

	@GetMapping("/register")
	public String register() {
		return "user/join";
	}
	
	@GetMapping("/idcheck")
//	@ResponseBody
	public @ResponseBody String idCheck(@RequestParam("ckid") String checkId) throws Exception {
		int idCount = memberService.idCheck(checkId);
		JSONObject json = new JSONObject();
		json.put("idcount", idCount);
		return json.toString();
	}

	@PostMapping("/register")
	public String register(MemberDto memberDto, Model model) throws Exception {
		logger.debug("memberDto info : {}", memberDto);
		memberService.registerMember(memberDto);
		return "redirect:/user/login";
	}

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) throws Exception {
		logger.debug("map : {}", map.get("userId"));
		MemberDto memberDto = memberService.login(map);
		System.out.println(memberDto);
		if (memberDto != null) {
			session.setAttribute("userInfo", memberDto);
			Cookie cookie = new Cookie("ssafy_id", map.get("userId"));
			cookie.setPath("/");
			if ("saveok".equals(map.get("idsave"))) {
				cookie.setMaxAge(60 * 60 * 24 * 365 * 40);
			} else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
			return "user/login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public String list() {
		return "user/infor";
	}
	
	@GetMapping("/update")
	public ModelAndView update(@RequestParam("id") String id) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = memberService.getMember(id);
		mav.addObject("member", memberDto);
		mav.setViewName("practice/update");
		return mav;
	}
	
	@PostMapping("/update")
	public String update(MemberDto memberDto, Model model , RedirectAttributes redirectAttributes)
			throws Exception{
		memberService.updateMember(memberDto);
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session,RedirectAttributes redirectAttributes)
			throws Exception {
		MemberDto memberDto=(MemberDto) session.getAttribute("userInfo");
		String id=memberDto.getId();
		System.out.println(id);
		memberService.deleteFavorite(id);
		memberService.deleteMember(id);
		session.invalidate();
		return "redirect:/";
	}
}
