import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {

  connect() {
    console.log("Is this thing on?")
  }

  async current_bonks() {
    console.log("Current Bonks")
    // const request = new FetchRequest('get', '/#get_popular_flops',
    //   {
    //     // body: JSON.stringify(
    //     //   {
    //     //     comment_type: 'comment',
    //     //     movie_id: movie_id,
    //     //     comment_title: comment_title,
    //     //     comment_body: comment_body_w_mention,
    //     //     mention: mention // mention handler i.e. @dude
    //     //   })
    //   })
    // const response = await request.perform()
    // if (response.ok) {
    //   const body = await response.text
    //   console.log(body)
    //   // location.reload()
    //   // Do whatever do you want with the response body
    //   // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
    // }

    fetch('/flops')
      .then((response) => response.json())
      .then((data) => console.log(data));
  
  }
}