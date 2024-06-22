import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  connect() {
    let userMention = ""
    let startRecording = false

    document.onkeydown = function (e) {
      if (e.shiftKey && e.keyCode == 50) {
        console.log("A mention is starting")
        startRecording = true
      }

      if (e.keyCode == 32) {
        startRecording = false
        // don't know how to do this through stimulus??
        // Create an XMLHttpRequest object
        const xhttp = new XMLHttpRequest();

        // Define a callback function
        xhttp.onload = function () {
          // Here you can use the Data
          console.log("Made it back")
          userMention = ""
        }

        // Send a request
        xhttp.open("POST", "/mention");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("user_mention=" + userMention);
      }

      if (startRecording) {
        if (e.keyCode >= 48 && e.keyCode <= 90)
          userMention += e.key
        console.log("User: ", userMention)
      }
    }
  }

  // async createMention(event) {
  //   console.log("Sending to server:", event.params)

  //   const request = new FetchRequest('post', '/mention', { body: JSON.stringify({ movie_id: event.params["movieId"], user_id: event.params["userId"], fav_type: event.params["favType"] }) })
  //   const response = await request.perform()
  //   if (response.ok) {
  //     const body = await response.text
  //     location.reload()
  //     // Do whatever do you want with the response body
  //     // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
  //   }
  // }
}