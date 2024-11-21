import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css"; // Assurez-vous d'importer le CSS

export default class extends Controller {
  connect() {
    console.log("Flatpickr initialized"); // Pour déboguer et vérifier si le contrôleur est exécuté
    flatpickr(this.element, {
      enableTime: true, // Active la sélection de l'heure
      dateFormat: "d-m-Y H:i", // Format de la date et de l'heure
      time_24hr: true, // Format 24 heures
      minDate: "today", // Pas de dates dans le passé
    });
  }
}
