import Vue from "vue";
import VueRouter from "vue-router";
import BoardView from "@/views/BoardView.vue";
import BoardList from "@/components/board/BoardList.vue";
import boardRegister from "@/components/board/BoardRegister.vue";
import boardDetail from "@/components/board/BoardDetail.vue";
import boardModify from "@/components/board/BoardModify.vue";
import boardDelete from "@/components/board/BoardDelete.vue";
import NewsList from "@/components/news/NewsList.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/happyhouse/vueboard",
    name: "board",
    component: BoardView,
    redirect: "/happyhouse/vueboard/list",
    children: [
      {
        path: "list",
        name: "boardList",
        component: BoardList,
      },
      {
        path: "write",
        name: "boardRegister",
        component: boardRegister,
      },
      {
        path: "detail/:articleno",
        name: "boardDetail",
        component: boardDetail,
      },
      {
        path: "modify/:articleno",
        name: "boardModify",
        component: boardModify,
      },
      {
        path: "delete/:articleno",
        name: "boardDelete",
        component: boardDelete,
      },
    ],
  },
  {
    path: "/happyhouse/newsBoard",
    name: "newsList",
    component: NewsList,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
