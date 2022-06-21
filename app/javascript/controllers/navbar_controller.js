import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "minisearch" ]
  updateNavbar () {
    if (window.scrollY >= 50) {
      this.element.classList.remove('navbar-transparent');
      this.element.classList.add('navbar-primary');
    } else {
      this.element.classList.remove('navbar-primary');
      this.element.classList.add('navbar-transparent');
    };
    if (window.scrollY >= 125) {
      this.minisearchTarget.classList.remove('d-none');
      console.log(this.minisearchTarget.children[0].children[2].classList.add('text-light'));
    } else {
      this.minisearchTarget.classList.add('d-none');
    }
  };
}
