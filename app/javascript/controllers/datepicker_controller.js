import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // Nécessaire pour utiliser Flatpickr

export default class extends Controller {
  connect() {
    flatpickr(this.element); // Initialise Flatpickr sur l'élément HTML ciblé
  }
}
