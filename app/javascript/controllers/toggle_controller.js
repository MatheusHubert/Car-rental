
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("connect")
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
