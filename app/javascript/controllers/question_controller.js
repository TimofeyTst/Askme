import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connected anwser");
  }

  toggleForm(event) {
    console.log("Clicked reply btn");
    event.preventDefault();
    event.stopPropagation();
    const form = document.getElementById("question_form");
    form.classList.toggle("d-none");
  }
}
