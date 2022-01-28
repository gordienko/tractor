import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
  }
  static get targets() {
      return [ "field", "results", "q", "option", "input", "submit", "preview"]
  }



  seek(e){
    e.preventDefault()    
    fetch(`/admin/links/search?q[title_cont]=${this.qTarget.value}`)
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = data["content"]
      })
  }

  selectRadioOption(e){
    this.optionTargets.forEach((el, i) => {
      el.classList.toggle("active", event.target == el )
    })
    this.inputTarget.value = event.target.dataset.id
    this.previewTarget.innerHTML = event.target.innerText
    this.submitTarget.disabled = false
  }

  greet(e){
    e.preventDefault()
    Rails.ajax({
      type: 'GET',
      url: `/admin/links/${this.inputTarget.value}/attachment?text=${this.editorText()}`,
      success: ({content, sgid}) => {
        this.editorController().setLinker(content, sgid);
      }
    })
  }

  editorText(){
    let text = this.editorElement().editor.getDocument().getStringAtRange(this.editorElement().editor.getSelectedRange())
    return text
  }

  editorController(){
    return this.application.getControllerForElementAndIdentifier(this.editorElement(), "bebop")
  }

  editorElement(){
    return document.querySelector(this.editorElementName())
  }

  editorElementName(){
    return `#${this.finderDiv().dataset.editorId}`
  }

  finderDiv(){
    return this.element.closest('.link-finder')
  }

}
