import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    console.log('embedder')
  }
  static get targets() {
      return [ "input", "submit"]
  }

  embedit(e){
    e.preventDefault
    let formData = new FormData()
    formData.append("content", this.inputTarget.value)

    Rails.ajax({
      type: 'PATCH',
      url: `/admin/embed/`,
      data: formData,
      success: ({content, sgid}) => {
        this.editorController().insertAttachment(content, sgid);
      }
    })
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
    return this.element.closest('.embedder')
  }
}
