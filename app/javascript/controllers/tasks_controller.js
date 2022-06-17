import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = [ "title", "completed" ]

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
    const tasks = this.completedTargets;
    tasks.forEach((task) => {
      if (task.checked) {
        this.titleTarget.classList.toggle("opacity-50");
      };
    });
  }

  toggle(event) {
    event.preventDefault();
    this.titleTarget.classList.toggle("opacity-50");
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
