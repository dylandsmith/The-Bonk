import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {

  connect() {
    console.log("Is this thing on?")
  }

  async current_bonks() {

    //const request = new FetchRequest('get', '/flops')
    //const response = await request.perform()
    // if (response.ok) {
    //   const body = await response.text
    //   location.reload()
    //   // Do whatever do you want with the response body
    //   // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
    // }
    // get popular flops from favorites movies
    // fetch('/flops')
    //   .then((response) => response.json())
    //   .then((data) => 
    //     {
    //       console.log(data)
    //       //location.reload()
    //     });

    const postsList = document.getElementById('postsList');

    fetch('/flops', {
      method: 'GET',
      headers: {
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].getAttribute('content'),
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/html',
        'Accept': 'application/html'
      },
      credentials: 'same-origin'
    }).then((response) => {
        if (response.status == 200) {
          response.text().then((content) => {
            console.log(content)
            postsList.innerHTML = content;
          })
        }
    });
  }
}