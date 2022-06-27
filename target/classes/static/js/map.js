var root = "";

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById("map"); // 지도를 표시할 div	
var mapOption = {
	    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	    level: 3, // 지도의 확대 레벨
	};

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
// 커스텀 오버레이를 생성합니다
var customOverlay;
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayMarkers(places) {
	var fragment = document.createDocumentFragment();
    var bounds = new kakao.maps.LatLngBounds();
    var listStr = "";
    
	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();
	removeMarker_store();
	removeMarker_cctv();
	removeMarker_green();
	for(var i=0; i<places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].lat, places[i].lng);
		var marker = addMarker(placePosition, i);
		var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);
		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
		(function (marker, title, code, place) {
			kakao.maps.event.addListener(marker, "click", function () {
				displayInfowindow(marker, title, place);
			});

		    kakao.maps.event.addListener(map, "click", function () {
		    	//console.log(customOverlay);
		    	//window.open('https://new.land.naver.com/search?sk='+place.dongName+' '+title,'포털 검색');
		    	customOverlay.setMap(null);
		    });

		    itemEl.onmouseover = function () {
		    	displayInfowindow(marker, title);
		    };

		    itemEl.onmouseout = function () {
		    	customOverlay.setMap(null);
		    };
		})(marker, places[i].aptName, places[i].aptCode, places[i]);

		fragment.appendChild(itemEl);
	}
	// 마커를 생성하고 지도에 표시합니다 

	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	map.setBounds(bounds);
}

//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
	imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
	imgOptions = {
		spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	},
	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	marker = new kakao.maps.Marker({
		position: position, // 마커의 위치
		image: markerImage,
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다

	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, place) {
	var el = document.createElement("li");
	var itemStr = `
		<span class="markerbg marker_${index + 1}></span>
		<div class="info"><h5>${place.aptName}</h5> <button>관심등록</button>
		<span>${place.sidoName} ${place.gugunName} ${place.dongName} ${place.jibun}</span>
	`;
	el.innerHTML = itemStr;
	el.className = "item";

	return el;
}

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title, place) {
	var content = `
		<div class="overlaybox">
			<div class="boxtitle">${title}</div>
			<div class="first"><img src="../assets/img/apt.png" style="width:247px; height:136px;" alt=""></div>
			<ul>
				<li class="up">
					<span class="title">건축년도</span>
					<span class="count">${place.buildYear}</span>
				</li>
				<li>
					<span class="title">주소</span>
					<span class="count">${place.sidoName} ${place.gugunName} ${place.dongName} ${place.jibun}</span>
				</li>
				<li>
					<span class="title">최신거래금액</span>
					<span class="count">${place.recentPrice}</span>
				</li>
			</ul>
		</div>
	`;
	var position = new kakao.maps.LatLng(marker.getPosition().getLat()+0.00033, marker.getPosition().getLng()-0.00003);
	customOverlay = new kakao.maps.CustomOverlay({
		position: position,
		content: content,
		xAnchor: 0.3,
		yAnchor: 0.91,
	});
	customOverlay.setMap(map);
}

//검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}


/*
 * 주변 상권(store)
 */
var markers_store = [];
var infowindow_store = new kakao.maps.InfoWindow({ zIndex: 1 });

// 검색 결과 목록과 마커를 표출하는 함수입니다
// 파라미터로 동만 받아오고, 공공 데이터 api로 데이터를 받아와야 합니다
function displayMarkers_store(dongcode) {
	var fragment = document.createDocumentFragment();
    var bounds = new kakao.maps.LatLngBounds();
    var listStr = "";
    var places = [];

	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/B553077/api/open/sdsc2/storeListInDong'; /*URL*/
    let apiKey = '%2Fz8c7pHj%2BfIuYsaYn3gJGbzPn38Ff6w2%2BJUEKhTEN6LzajDYkXwDLox5APuTMA82FWK43YnrmpYEVj%2FAaiOFpw%3D%3D';
	var queryParams = '?' + encodeURIComponent('divId') + '=' + encodeURIComponent('signguCd'); /*Service Key*/
	queryParams += '&' + encodeURIComponent('key') + '=' + encodeURIComponent(parseInt(dongcode/100000)); /**/
	queryParams += '&' + encodeURIComponent('serviceKey') + '='+apiKey; /**/
	
	xhr.open('GET', url + queryParams, false);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	
	    	let t_xml = this.responseText;
//	    	console.log(t_xml);
	    	
	    	let parseXML = new DOMParser();
	    	let xmlDoc = parseXML.parseFromString(t_xml, "text/xml");

	    	let arr = new Array();
	    	let items = xmlDoc.getElementsByTagName("item"); // item 태그들을 모두 가져와 배열로 저장
	    	for(let item_node of items){ // 가져온 item 태그들을 순회
	    		var cur_place = { };
	    		
//	    		console.log(item_node);

		    	for(let child_node of item_node.children) { // item 태그 안에 또 여러가지 태그가 있으니 또 순회
		    		switch(child_node.nodeName) {
		    		  case 'bizesNm':
		    			  cur_place.bizesNm = child_node.textContent;
		    			  break;

		    		  case 'brchNm':
		    			  cur_place.brchNm = child_node.textContent;
		    			  break;
		    			  
		    		  case 'indsSclsNm':
		    			  cur_place.indsSclsNm = child_node.textContent;
		    			  break;

		    		  case 'rdnmAdr':
		    			  cur_place.rdnmAdr = child_node.textContent;
		    			  break;

		    		  case 'lon':
		    			  cur_place.lon = child_node.textContent;
		    			  break;

		    		  case 'lat':
		    			  cur_place.lat = child_node.textContent;
		    			  break;
		    		}
		    		
			    }
		    	// console.log(cur_place);
		    	places.push(cur_place);
	    	}
	    	
	    } 
	};

	xhr.send('');

//    console.log("places: "+places);
//    console.log(places[0]);
//    console.log(places[0].bizesNm);
	
	for(var i=0; i<places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].lat, places[i].lon);
		var marker = addMarker_store(placePosition, i, places[i].bizesNm);
		var itemEl = getListItem_store(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);
		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
		(function (marker, title, place) {
//			console.log("marker: "+marker);
//			console.log("title: "+title);
//			console.log("code: "+code);
//			console.log("place: "+place);
			kakao.maps.event.addListener(marker, "click", function () {
				displayInfowindow_store(marker, title, place);
			});

		    kakao.maps.event.addListener(map, "click", function () {
		    	//console.log(customOverlay);
		    	//window.open('https://new.land.naver.com/search?sk='+place.dongName+' '+title,'포털 검색');
		    	customOverlay.setMap(null);
		    });

		    itemEl.onmouseover = function () {
		    	displayInfowindow_store(marker, title);
		    };

		    itemEl.onmouseout = function () {
		    	customOverlay.setMap(null);
		    };
		})(marker, places[i].bizesNm, places[i]);

		fragment.appendChild(itemEl);
	}

}

//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker_store(position, idx, title) {
//	console.log(position, idx, title);
	var imageSrc = "../assets/marker/marker_store.png", // 마커 이미지 url
	imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
	imgOptions = {
		offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	},
	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	marker = new kakao.maps.Marker({
		position: position, // 마커의 위치
		image: markerImage,
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers_store.push(marker); // 배열에 생성된 마커를 추가합니다

	// console.log("marker added: "+ marker.getPosition()+" "+marker.getTitle()+" "+marker.getVisible()+" ");
	
	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker_store() {
	for (var i = 0; i < markers_store.length; i++) {
		markers_store[i].setMap(null);
	}
	markers_store = [];
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem_store(index, place) {
	var el = document.createElement("li");
	var itemStr = `
		<span class="markerbg marker_${index + 1}></span>
		<div class="info"><h5>${place.aptName}</h5> <button>관심등록</button>
		<span>${place.sidoName} ${place.gugunName} ${place.dongName} ${place.jibun}</span>
	`;
	el.innerHTML = itemStr;
	el.className = "item";

	return el;
}

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
function displayInfowindow_store(marker, title, place) {
	var content = `
		<div class="overlaybox" style="height: 150px;">
			<div class="boxtitle">${title}</div>
			<ul>
				<li class="up">
					<span class="title">상호명</span>
					<span class="count">${place.bizesNm} ${place.brchNm}</span>
				</li>
				<li>
					<span class="title">업종</span>
					<span class="count">${place.indsSclsNm}</span>
				</li>
				<li>
					<span class="title">주소</span>
					<span class="count">${place.rdnmAdr}</span>
				</li>
			</ul>
		</div>
	`;
	var position = new kakao.maps.LatLng(marker.getPosition().getLat()+0.00033, marker.getPosition().getLng()-0.00003);
	customOverlay = new kakao.maps.CustomOverlay({
		position: position,
		content: content,
		xAnchor: 0.3,
		yAnchor: 0.91,
	});
	customOverlay.setMap(map);
}





/*
 * CCTV(안심이)
 */
var markers_cctv = [];
var infowindow_cctv = new kakao.maps.InfoWindow({ zIndex: 1 });

// 검색 결과 목록과 마커를 표출하는 함수입니다
// 파라미터로 동만 받아오고, 공공 데이터 api로 데이터를 받아와야 합니다
function displayMarkers_cctv(gugun) {
	var fragment = document.createDocumentFragment();
    var bounds = new kakao.maps.LatLngBounds();
    var listStr = "";
    var places = [];

	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.seoul.go.kr:8088/59576949756f6f70353056776c636a/xml/safeOpenCCTV'; /*URL*/
	
	var startIdx = 1;
	var endIdx = 999;
	while(endIdx < 10000){
		var fixedURL = url + '/' + startIdx + '/' + endIdx + '/' + gugun;
		// console.log(fixedURL);
		xhr.open('GET', fixedURL, false);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		    	
		    	let t_xml = this.responseText;
		    	// console.log(t_xml);
		    	
		    	let parseXML = new DOMParser();
		    	let xmlDoc = parseXML.parseFromString(t_xml, "text/xml");

		    	let arr = new Array();
		    	let items = xmlDoc.getElementsByTagName("row"); // row 태그들을 모두 가져와 배열로 저장
		    	for(let item_node of items){ // 가져온 row 태그들을 순회
		    		var cur_place = { };
		    		
		    		// console.log(item_node);

			    	for(let child_node of item_node.children) { // item 태그 안에 또 여러가지 태그가 있으니 또 순회
			    		switch(child_node.nodeName) {
			    		  case 'ADDR':
			    			  cur_place.ADDR = child_node.textContent;
			    			  break;

			    		  case 'CCTVUSE':
			    			  cur_place.CCTVUSE = child_node.textContent;
			    			  break;
			    			  
			    		  case 'WGSXPT':
			    			  cur_place.WGSXPT = child_node.textContent;
			    			  break;

			    		  case 'WGSYPT':
			    			  cur_place.WGSYPT = child_node.textContent;
			    			  break;
			    		}
			    		
				    }
			    	//console.log(cur_place);
			    	
			    	if(cur_place.CCTVUSE == "방범")
			    		places.push(cur_place);
		    	}
		    	
		    } 
		};

		xhr.send('');
		
		startIdx = endIdx+1;
		endIdx = endIdx+1000;
	}


//    console.log("places: "+places);
//    console.log(places[0]);
//    console.log(places[0].ADDR);
	
	for(var i=0; i<places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].WGSXPT, places[i].WGSYPT);
		var marker = addMarker_cctv(placePosition, i, places[i].ADDR);
		var itemEl = getListItem_cctv(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);
		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
		(function (marker, title, place) {

			
		})(marker, places[i].ADDR, places[i]);

		fragment.appendChild(itemEl);
	}

}

//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker_cctv(position, idx, title) {
	//console.log(position, idx, title);
	var imageSrc = "../assets/marker/marker_cctv.png", // 마커 이미지 url
	imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
	imgOptions = {
		offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	},
	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	marker = new kakao.maps.Marker({
		position: position, // 마커의 위치
		image: markerImage,
		title: title,
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers_cctv.push(marker); // 배열에 생성된 마커를 추가합니다

	//console.log("marker added: "+ marker.getPosition()+" "+marker.getTitle()+" "+marker.getVisible()+" ");
	
	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker_cctv() {
	for (var i = 0; i < markers_cctv.length; i++) {
		markers_cctv[i].setMap(null);
	}
	markers_cctv = [];
}


//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem_cctv(index, place) {
	var el = document.createElement("li");
	var itemStr = `
		<span class="markerbg marker_${index + 1}></span>
		<div class="info"><h5>${place.aptName}</h5> <button>관심등록</button>
		<span>${place.sidoName} ${place.gugunName} ${place.dongName} ${place.jibun}</span>
	`;
	el.innerHTML = itemStr;
	el.className = "item";

	return el;
}







/*
 * 주변 녹지대(green)
 */
var markers_green = [];
var infowindow_green = new kakao.maps.InfoWindow({ zIndex: 1 });

// 검색 결과 목록과 마커를 표출하는 함수입니다
// 파라미터로 동만 받아오고, 공공 데이터 api로 데이터를 받아와야 합니다
function displayMarkers_green() {
	var fragment = document.createDocumentFragment();
    var bounds = new kakao.maps.LatLngBounds();
    var listStr = "";
    var places = [];

	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.seoul.go.kr:8088/78476169466f6f703331445076784b/xml/SearchParkInfoService/1/132/'; /*URL*/
	
	xhr.open('GET', url, false);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	
	    	let t_xml = this.responseText;
	    	//console.log(t_xml);
	    	
	    	let parseXML = new DOMParser();
	    	let xmlDoc = parseXML.parseFromString(t_xml, "text/xml");

	    	let arr = new Array();
	    	let items = xmlDoc.getElementsByTagName("row"); // row 태그들을 모두 가져와 배열로 저장
	    	for(let item_node of items){ // 가져온 row 태그들을 순회
	    		var cur_place = { };
	    		
	    		//console.log(item_node);

		    	for(let child_node of item_node.children) { // item 태그 안에 또 여러가지 태그가 있으니 또 순회
		    		switch(child_node.nodeName) {
		    		  case 'P_PARK':
		    			  cur_place.P_PARK = child_node.textContent;
		    			  break;

		    		  case 'P_LIST_CONTENT':
		    			  cur_place.P_LIST_CONTENT = child_node.textContent;
		    			  break;
		    			  
		    		  case 'P_ADDR':
		    			  cur_place.P_ADDR = child_node.textContent;
		    			  break;

		    		  case 'LONGITUDE':
		    			  cur_place.LONGITUDE = child_node.textContent;
		    			  break;

		    		  case 'LATITUDE':
		    			  cur_place.LATITUDE = child_node.textContent;
		    			  break;
		    		}
		    		
			    }
		    	 //console.log(cur_place);
		    	places.push(cur_place);
	    	}
	    	
	    } 
	};

	xhr.send('');

//    console.log("places: "+places);
//    console.log(places[0]);
//    console.log(places[0].bizesNm);
	
	for(var i=0; i<places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].LATITUDE, places[i].LONGITUDE);
		var marker = addMarker_green(placePosition, i, places[i].P_PARK);
		var itemEl = getListItem_green(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);
		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
		(function (marker, title, place) {
//			console.log("marker: "+marker);
//			console.log("title: "+title);
//			console.log("code: "+code);
//			console.log("place: "+place);
			kakao.maps.event.addListener(marker, "click", function () {
				displayInfowindow_green(marker, title, place);
			});

		    kakao.maps.event.addListener(map, "click", function () {
		    	//console.log(customOverlay);
		    	//window.open('https://new.land.naver.com/search?sk='+place.dongName+' '+title,'포털 검색');
		    	customOverlay.setMap(null);
		    });

		    itemEl.onmouseover = function () {
		    	displayInfowindow_green(marker, title);
		    };

		    itemEl.onmouseout = function () {
		    	customOverlay.setMap(null);
		    };
		})(marker, places[i].P_PARK, places[i]);

		fragment.appendChild(itemEl);
	}

}

//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker_green(position, idx, title) {
	//console.log(position, idx, title);
	var imageSrc = "../assets/marker/marker_green.png", // 마커 이미지 url
	imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
	imgOptions = {
		offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	},
	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	marker = new kakao.maps.Marker({
		position: position, // 마커의 위치
		image: markerImage,
		title: title,
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers_green.push(marker); // 배열에 생성된 마커를 추가합니다

	 //console.log("marker added: "+ marker.getPosition()+" "+marker.getTitle()+" "+marker.getVisible()+" ");
	
	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker_green() {
	for (var i = 0; i < markers_green.length; i++) {
		markers_green[i].setMap(null);
	}
	markers_green = [];
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem_green(index, place) {
	var el = document.createElement("li");
	var itemStr = `
		<span class="markerbg marker_${index + 1}></span>
		<div class="info"><h5>${place.aptName}</h5> <button>관심등록</button>
		<span>${place.sidoName} ${place.gugunName} ${place.dongName} ${place.jibun}</span>
	`;
	el.innerHTML = itemStr;
	el.className = "item";

	return el;
}

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
function displayInfowindow_green(marker, title, place) {
	var content = `
		<div class="overlaybox" style="height: 370px;">
			<div class="boxtitle">${title}</div>
			<ul>
				<li class="up">
					<span class="title">이름</span>
					<span class="count">${place.P_PARK}</span>
				</li>
				<li>
					<span class="title">주소</span>
					<span class="count">${place.P_ADDR}</span>
				</li>
				<li>
					<span class="title" style="height: 180px;">안내</span>
					<span class="count" style="white-space: normal; padding-left: 13px; line-height:18px;"><br>${place.P_LIST_CONTENT}</span>
				</li>
			</ul>
		</div>
	`;
	var position = new kakao.maps.LatLng(marker.getPosition().getLat()+0.00033, marker.getPosition().getLng()-0.00003);
	customOverlay = new kakao.maps.CustomOverlay({
		position: position,
		content: content,
		xAnchor: 0.3,
		yAnchor: 0.91,
	});
	customOverlay.setMap(map);
}












