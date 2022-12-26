import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connected anwser");
  }

  toggleForm(event) {
    console.log("Clicked reply btn");
    event.preventDefault();
    event.stopPropagation();
    const formID = event.params["form"];
    const form = document.getElementById(formID)
    form.classList.toggle("d-none");
  }
}
