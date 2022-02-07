import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
      console.log('boo')
  }
  static get targets() {
      return [  "name", "results", "q", "menuitemableId", "menuitemableType"]
  }

  search(e){
    this.menuitemableIdTarget.value = ''
    this.menuitemableTypeTarget.value = ''
    this.resultsTarget.innerHTML = 'searching'
    e.preventDefault()
    fetch(`/admin/links/menuitems?q=${this.qTarget.value}`)
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = data["content"]
      })
  }

  selectOption(e){
    e.preventDefault()
    this.qTarget.value = event.target.dataset.link
    this.nameTarget.value= event.target.dataset.title
    this.menuitemableIdTarget.value = event.target.dataset.id
    this.menuitemableTypeTarget.value = event.target.dataset.type

    this.resultsTarget.innerHTML = ''
  }
}
