import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.onkeydown = function (e) {
  if(e.shiftKey && e.keyCode == 50)
    console.log("A mention is starting")
  else if(e.keyCode == 32)
    console.log("Spacebar")
  // switch (e.keyCode) {
  //   case 16 && 50:
  //       console.log('A mention is starting');
  //       break;
  //   case 32:
  //       console.log('Spacebar');
  //       break;

  //   default:
  //       return; // Do nothing for the rest
  // }
};