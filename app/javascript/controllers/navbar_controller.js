import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  updateNavbar () {
    if (window.scrollY >= 50) {
      this.element.classList.remove('navbar-transparent');
      this.element.classList.add('navbar-primary');
    } else {
      this.element.classList.remove('navbar-primary');
      this.element.classList.add('navbar-transparent');
    };
  };
}
