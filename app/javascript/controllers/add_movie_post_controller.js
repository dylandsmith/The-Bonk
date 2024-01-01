import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets=["source"]
  // initialize() {
  //   console.log(this.data.get("length"))
  //   for(let i=0; i<= this.data.get("length"); i++) {
  //     targets.push("source" + i)
  //   }
  // }

  // connect() {
  //   console.log(this.data.get("length"))
  // }

  postComment(event) {
    console.log(this.sourceTarget)
    let modalController = this.application.getControllerForElementAndIdentifier(
      this.sourceTarget,
      "modal"
    )

    //console.log(modalController)

    modalController.open()
  }
}