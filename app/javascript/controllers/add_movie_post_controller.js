import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source"]
  
  postComment() {
    let modalController = this.application.getControllerForElementAndIdentifier(
      this.sourceTarget,
      "modal"
    )

    console.log(modalController)

    modalController.open()
  }
}