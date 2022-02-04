import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
      console.log('boo')
  }
  static get targets() {
      return [  "results", "menuitemableId", "menuitemableType"]
  }
}
