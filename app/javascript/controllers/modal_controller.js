import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  initialize() {
    console.log("Modal controller connected.")
  }

  open() {
    console.log("The modal has opened")
    const elem = document.querySelector('.modal')
    elem.style.display = 'block'
  }

  close() {
    console.log("The modal has opened")
    const elem = document.querySelector('.modal')
    elem.style.display = 'none'
  }
}