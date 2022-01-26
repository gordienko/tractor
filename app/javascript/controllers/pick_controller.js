import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static get targets() {
      return [ "field" ]
  }

  connect() {
  }

  choosemedia({ params: { id} }){
    this.editorController().setmedia(id);
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
    return this.element.closest('#media-finder')
  }
}
