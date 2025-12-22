// app/javascript/controllers/movie_display_controller.js
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="movie-display"
export default class extends Controller {

  static values = { title: String }
  static targets = ["results"] 

  connect() {
    // Listen for toggle events on this <details> element
    this.element.addEventListener("toggle", this.toggle.bind(this));
  }

  disconnect() {
    // Clean up the listener when the element is removed
    this.element.removeEventListener("toggle", this.toggle.bind(this));
  }

  async toggle() {
    console.log("TITLE VALUE:", this.titleValue) 
    // Run only when opening, not closing
    if (!this.element.open) return

    this.resultsTarget.innerHTML = "<em>Searching streaming availability...</em>"

    const response = await fetch(`/watch/search?title=${encodeURIComponent(this.titleValue)}`, {
      headers: { "Accept": "text/html" }
    })

    const html = await response.text()
    this.resultsTarget.innerHTML = html
  }
  
  // toggle(event) {
  //   console.log("Toggled:", this.element.open);
  //   // You can add logic here, e.g.:
  //   // this.element.open ? this.expand() : this.collapse();
  // }
  

  // guard(e) {
  //   if (!e.target.closest("target-button")) {
  //     e.preventDefault() // block default toggle
  //     console.log("prevented")
  //   }
  // }

  // toggle(e) {
  //   e.stopPropagation()
  //   console.log("e")
  //   this.element.open = !this.element.open
  // }
}
