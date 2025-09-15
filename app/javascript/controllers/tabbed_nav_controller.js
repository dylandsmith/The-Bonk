// import { Controller } from "@hotwired/stimulus"
// import { FetchRequest } from '@rails/request.js'

// export default class extends Controller {

//   connect() {
//     console.log("Is this thing on?")

//     // fetch('/favorites').then((response) => {
//     //   if (response.status == 200) {
//     //     response.text().then((content) => {
//     //       console.log(content)
//     //       postsList.innerHTML = content;
//     //     })
//     //   }
//     // });
//     // fetch('/favorites')
//     //   .then(response => response.json())
//     //   .then(html => {
//     //     console.log(html)
//     //     this.element.innerHTML = html
//     //   })

//     this.current_bonks();
//   }

//   async current_bonks() {

//     //const request = new FetchRequest('get', '/flops')
//     //const response = await request.perform()
//     // if (response.ok) {
//     //   const body = await response.text
//     //   location.reload()
//     //   // Do whatever do you want with the response body
//     //   // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
//     // }
//     // get popular flops from favorites movies
//     // fetch('/flops')
//     //   .then((response) => response.json())
//     //   .then((data) => 
//     //     {
//     //       console.log(data)
//     //       //location.reload()
//     //     });

//     try {
//       const response = await fetch("/flops", {
//         method: "GET",
//         headers: {
//           "Accept": "application/json"
//         }
//       });

//       if (!response.ok) throw new Error("Network error");

//       const data = await response.json();
//       this.outputTarget.textContent = data.message;
//     } catch (error) {
//       console.error("Fetch error:", error);
//     }

//     // const postsList = document.getElementById('postsList');

//     // fetch('/flops').then((response) => {
//     //     if (response.status == 200) {
//     //       response.text().then((content) => {
//     //         console.log(content)
//     //         postsList.innerHTML = content;
//     //       })
//     //     }
//     // });
//   }
// }