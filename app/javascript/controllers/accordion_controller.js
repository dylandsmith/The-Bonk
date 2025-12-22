import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  guard(e) {
    if (!e.target.closest("button")) {
      e.preventDefault() // block default toggle
    }
  }

  toggle(e) {
    this.element.open = !this.element.open
  }
}