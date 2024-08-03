import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {

  connect() {
    // console.log(this.data.get("testValue"))
  }

  async submitPost (event) {
    const btn = document.getElementById("add-comments-btn")
    const movie_id = document.getElementById("movie_id").value
    const comment_title = document.getElementById("comment-title").value
    const comment_body = document.getElementById("comment_body").value
    let comment_body_w_mention = ""

    let mention = comment_body.match(/@\w*\s*\,*/)[0]

    if (mention) {
      mention = mention.slice(0, mention.length - 1)
      comment_body_w_mention = comment_body.replace(mention, "<span class='mention'>" + mention + "</span>")

      const xhttp = new XMLHttpRequest();

      xhttp.open("POST", "/mention");
      xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhttp.send("user_mention=" + mention);
    }


    btn.setAttribute("class", "add-post")
    const request = new FetchRequest('post', '/posts', { body: JSON.stringify({ comment_type: 'comment', movie_id: movie_id, comment_title: comment_title, comment_body: comment_body_w_mention }) })
    const response = await request.perform()
    if (response.ok) {
      const body = await response.text
      location.reload()
      // Do whatever do you want with the response body
      // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
    }
  }

  async submitReply(event) {
    // console.log(event.params)
    const btn = document.getElementById("add-comments-btn")
    const movie_id = document.getElementById("movie_id").value
    const comment_title = document.getElementById("reply-title-" + event.params["postId"]).value
    const comment_body = document.getElementById("reply-body-" + event.params["postId"]).value

    btn.setAttribute("class", "add-post")
    const request = new FetchRequest('post', '/posts', { body: JSON.stringify({ comment_type: 'reply', parent_id: event.params["postId"], movie_id: movie_id, comment_title: comment_title, comment_body: comment_body }) })
    const response = await request.perform()
    if (response.ok) {
      const body = await response.text
      location.reload()
      // Do whatever do you want with the response body
      // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
    }
  }
}