import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {

  connect() {
    // console.log(this.data.get("testValue"))
  }

  async submitPost (event) {
    const btn = document.getElementById("add-comments-btn")
    const movie_id = document.getElementById("movie_id").value
    const comment_title = document.getElementById("comment_title").value
    const comment_body = document.getElementById("comment_body").value

    btn.setAttribute("class", "add-post")
    const request = new FetchRequest('post', '/posts', { body: JSON.stringify({ movie_id: movie_id, comment_title: comment_title, comment_body: comment_body }) })
    const response = await request.perform()
    if (response.ok) {
      const body = await response.text
      // Do whatever do you want with the response body
      // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
    }
  }

  submitReply(event) {
    console.log(event.params)
  }
}