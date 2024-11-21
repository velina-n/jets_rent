import { Application } from "@hotwired/stimulus"
import "flatpickr/dist/themes/dark.css";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
