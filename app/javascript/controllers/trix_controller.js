import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static get targets() {
      return [ "editor", "imageFields", "altField" ]
  }

  insertAttachment(event) {
    let attachment = new Trix.Attachment({content: `<span class="trix-attachment-starship-image" data-label="Alt text">
      <img src="${event.detail.embeddedUrl}" />
    </span>`, contentType: "Starship::Image"})
    this.editor.insertAttachment(attachment)
  }


  get editor() {
    return this.editorTarget.editor
  }
}
