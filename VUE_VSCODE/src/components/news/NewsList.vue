<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>최신 뉴스 목록</h3></b-alert>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <b-table
          striped
          hover
          :items="News"
          :per-page="perPage"
          :current-page="currentPage"
          :fields="fields"
          @row-clicked="viewArticle"
        >
          <b-card
            :header-html="`<h3>${News.no}.
          ${News.title} [${News.date}]</h3>`"
            class="mb-2"
            border-variant="dark"
            no-body
          >
          </b-card>
        </b-table>
        <b-pagination
          v-model="currentPage"
          :total-rows="rows"
          :per-page="perPage"
          align="center"
        ></b-pagination>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import http from "@/api/http";

export default {
  name: "NewsList",
  data() {
    return {
      News: [],
      fields: [
        { key: "no", label: "글번호", tdClass: "tdClass" },
        { key: "title", label: "제목", tdClass: "tdSubject" },
        { key: "date", label: "작성일", tdClass: "tdClass" },
      ],
      currentPage: 1,
      perPage: 10,
    };
  },
  created() {
    http.get(`/news`).then(({ data }) => {
      this.News = data;
    });
  },
  methods: {
    viewArticle(news) {
      const url = news.url;
      window.location.href = "https://land.naver.com" + url;
    },
  },
  computed: {
    rows() {
      return this.News.length;
    },
  },
};
</script>

<style scope>
.tdClass {
  width: 50px;
  text-align: left;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
</style>
