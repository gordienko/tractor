import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
export default class extends Controller {
  static get targets() {
      return [ "results", "q",  "file", "submit", "more"]
  }

  connect() {
    
  }

  initialize() {
    this.offset = 40
  }

  choosemedia({ params: { id} }){
    this.setmedia(id);
  }

  upload(e){
       e.preventDefault()
       let formData = new FormData()
       formData.append("media[file]", this.fileTarget.files[0]);
       let _this = this
       Rails.ajax({
         type: 'POST',
         url: `/admin/medias/new/pickercreate`,
         data: formData,
         format: 'json',
         success: function(a){
           let content = a.content
           let sgid = a.sgid
           _this.editorController().insertAttachment(content, sgid);
         }
       })

  }

  more(e){
      e.preventDefault()
      fetch(`/admin/medias/search?offset=${this.offset}&q[name_cont]=${this.qTarget.value}&commit=Search`)
        .then(response => response.json())
        .then(data => {
          this.resultsTarget.innerHTML += data["content"]
          this.offset = this.offset + 40
         this.checkMediaCount(data["count"])
        })
  }

  listmedia(){
    fetch(`/admin/medias/search?offset=0&q[name_cont]=${this.qTarget.value}&commit=Search`)
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = data["content"]
        this.offset = 40
        this.checkMediaCount(data["count"])
      })
  }

  setmedia(id){
     Rails.ajax({
       type: 'GET',
       url: `/admin/medias/${id}/attachment`,
       success: ({content, sgid}) => {
           this.editorController().insertAttachment(content, sgid);
       }
     })
  }

  checkMediaCount(count){
    if (count < this.offset){
     this.moreTarget.classList.add('hide')
    }
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
    return this.element.closest('.pick')
  }
}
