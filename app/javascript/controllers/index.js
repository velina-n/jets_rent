// app/javascript/controllers/index.js
import { Application } from "@hotwired/stimulus"
import DatepickerController from "./datepicker_controller"

const application = Application.start()
application.register("datepicker", DatepickerController) // Enregistrement du contrôleur
