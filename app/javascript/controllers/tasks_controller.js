import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = [ "completed" ]

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
  }

  toggle(event) {
    event.preventDefault();
    let formData = new FormData();
    formData.append("task[completed]", this.completedTarget.checked);
    fetch(this.data.get("update-url"), {
          body: formData,
          method: "PATCH",
          credentials: "include",
          dataType: "script",
          headers: {
                  "Accept": "application/json",
                  "X-CSRF-Token": this.csrfToken
           }
    });
  }
}
