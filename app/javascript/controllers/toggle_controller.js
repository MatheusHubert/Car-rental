
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement", "priceText", "start_date", "end_date"]
  static values = {
    price: Number
  }

  connect() {
    console.log("connect")
    console.log(this.priceValue)
  }

  setStartDate(e) {
    console.log(e.target.value)
    this.startDate = e.target.value
    if (this.startDate && this.endDate) {
      this.#setPrice()
    }
  }

  setEndDate(e) {
    console.log(e.target.value)
    this.endDate = e.target.value
    if (this.startDate && this.endDate) {
        this.#setPrice()
      }
  }

  #setPrice() {
    if ( this.startDate && this.endDate) {

      let sDateParts = this.startDate.split("-")
      let sDate = new Date(sDateParts[2], sDateParts[1], sDateParts[0])
      let eDateParts = this.endDate.split("-")
      let eDate = new Date(eDateParts[2], eDateParts[1], eDateParts[0])
      let days = (eDate - sDate)/(1000*60*60*24)
      let price = days * this.priceValue
      console.log(price)
      this.priceTextTarget.classList.remove("d-none")
      this.priceTextTarget.innerText = `Price: €${price}`
    }
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
