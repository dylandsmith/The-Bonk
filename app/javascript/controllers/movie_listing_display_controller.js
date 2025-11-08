// app/javascript/controllers/movie_display_controller.js
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="movie-display"
export default class extends Controller {
  connect() {
    // Listen for toggle events on this <details> element
    this.element.addEventListener("toggle", this.toggle.bind(this));
  }

  disconnect() {
    // Clean up the listener when the element is removed
    this.element.removeEventListener("toggle", this.toggle.bind(this));
  }

  toggle(event) {
    console.log("Toggled:", this.element.open);
    // You can add logic here, e.g.:
    // this.element.open ? this.expand() : this.collapse();
  }
}
