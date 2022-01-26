import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  static get targets() {
      return [ "field" ]
  }

  connect() {
    console.log('hello pick')
  }

  choosemedia({ params: { id} }){
    console.log('boop')
    console.log(id)
    console.log(this.editorElementName())
    console.log(this.editorController().boink())
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
