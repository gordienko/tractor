import { Controller } from "@hotwired/stimulus"
import Trix from 'trix'
import Rails from "@rails/ujs"
addHeadingAttributes()
export default class extends Controller {
  static get targets() {
      return [ "field" ]
  }

  initialize() {
    this.offset = 40
  }

  connect() {
    this.addEmbedButton()
    this.addEmbedDialog()
    this.eventListenerForEmbedButton()
    this.eventListenerForAddEmbedButton()

    this.insertHeadingElements()

    this.addMediaButton()
    this.addMediaDialog()
    this.eventListenerForMediaButton()
    this.eventListenerForMediaSearch()
    this.eventListenerForMediaMoreButton()

  }

  //////////////// Embeds ////////////////////////////////////////////////////
  addEmbedButton() {
    const buttonHTML = '<button  type="button" class="trix-button tricks-embed"  data-trix-attribute="embed" data-trix-action="embed"    title="Embed" tabindex="-1">Embed</button>'
    this.buttonGroupBlockTools.insertAdjacentHTML("beforeend", buttonHTML)
  }

  addEmbedDialog() {
    const dialogHTML = `<div class="trix-dialog trix-dialog--link" data-trix-dialog="embed" data-trix-dialog-attribute="embed" data-tricks-target="embeddialog">
                          <div class="trix-dialog__link-fields">
                            <input type="text" name="embed" class="trix-input trix-input--dialog" placeholder="Paste your URL" aria-label="embed code" required="" data-trix-input="" disabled="disabled">
                            <div class="trix-button-group">
                              <input type="button" class="trix-button trix-button--dialog" data-trix-custom="add-embed" value="Add">
                            </div>
                          </div>
                        </div>`
    this.dialogsElement.insertAdjacentHTML("beforeend", dialogHTML)
  }

  showembed(e){
    const dialog = this.toolbarElement.querySelector('[data-trix-dialog="embed"]')
    const embedInput = this.dialogsElement.querySelector('[name="embed"]')
    if (event.target.classList.contains("trix-active")) {
      event.target.classList.remove("trix-active");
      dialog.classList.remove("trix-active");
      delete dialog.dataset.trixActive;
      embedInput.setAttribute("disabled", "disabled");
    } else {
      event.target.classList.add("trix-active");
      dialog.classList.add("trix-active");
      dialog.dataset.trixActive = "";
      embedInput.removeAttribute("disabled");
      embedInput.focus();
    }
  }

  eventListenerForEmbedButton() {
    this.toolbarElement.querySelector('[data-trix-action="embed"]').addEventListener("click", e => {
      this.showembed(e)
    })
  }

  eventListenerForAddEmbedButton() {
    this.dialogsElement.querySelector('[data-trix-custom="add-embed"]').addEventListener("click", event => {
      const content = this.dialogsElement.querySelector("[name='embed']").value
      if (content) {
        let _this = this
        let formData = new FormData()
        formData.append("content", content)
        Rails.ajax({
          type: 'PATCH',
          url: '/admin/embed.json',
          data: formData,
          success: ({content, sgid}) => {
            const attachment = new Trix.Attachment({content, sgid})
            _this.element.editor.insertAttachment(attachment)
            _this.element.editor.insertLineBreak()
          }
        })
      }
    })
  }

  //////////////// Headers ////////////////////////////////////////////////////

  insertHeadingElements() {
    this.removeOriginalHeadingButton()
    this.insertNewHeadingButton()
    this.insertHeadingDialog()
  }
  removeOriginalHeadingButton() {
   this.buttonGroupBlockTools.removeChild(this.originalHeadingButton)
  }

  insertNewHeadingButton() {
   this.buttonGroupBlockTools.insertAdjacentHTML("afterbegin", this.headingButtonTemplate)
  }

  insertHeadingDialog() {
   this.dialogsElement.insertAdjacentHTML("beforeend", this.dialogHeadingTemplate)
  }

  get dialogHeadingTemplate() {
    return `
      <div class="trix-dialog trix-dialog--heading" data-trix-dialog="x-heading" data-trix-dialog-attribute="x-heading">
        <div class="trix-dialog__link-fields">

          <div class="trix-button-group">
            <button type="button" class="trix-button trix-button--dialog" data-trix-attribute="heading1">H1</button>
            <button type="button" class="trix-button trix-button--dialog" data-trix-attribute="heading2">H2</button>
            <button type="button" class="trix-button trix-button--dialog" data-trix-attribute="heading3">H3</button>
            <button type="button" class="trix-button trix-button--dialog" data-trix-attribute="heading4">H4</button>
            <button type="button" class="trix-button trix-button--dialog" data-trix-attribute="heading5">H5</button>
            <button type="button" class="trix-button trix-button--dialog" data-trix-attribute="heading6">H6</button>
          </div>
        </div>
      </div>
    `
  }

  get headingButtonTemplate() {
     return '<button type="button" class="trix-button trix-button--icon trix-button--icon-heading-1" data-trix-action="x-heading" title="Heading" tabindex="-1">Heading</button>'
   }

   get originalHeadingButton() {
     return this.toolbarElement.querySelector("[data-trix-attribute=heading1]")
   }


   //////////////// MEDIA ////////////////////////////////////////////////////

   addMediaButton() {
     const buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="media" data-trix-action="media" title="Media" tabindex="-1">Image</button>'
     this.buttonGroupFileTools.insertAdjacentHTML("beforeend", buttonHTML)
   }

   addMediaDialog(){
     const dialogHTML = `<div class="trix-dialog trix-dialog--link trix-dialog--media" data-trix-dialog="media" data-trix-dialog-attribute="media">
                           <div class="trix-dialog__link-fields">
                             <input type="text" name="q[name_cont]" class="media-search-input trix-input trix-input--dialog" placeholder="Search for Media" aria-label="Media Picker" required="" data-trix-input="" disabled="disabled">
                             <div class="trix-button-group">
                               <input type="button" class="media-search trix-button trix-button--dialog" data-action="click->bebop#listmedia" data-trix-custom="find-media" value="Search">
                             </div>
                           </div>
                           <div id='media-finder'  data-editor-id="${this.element.id}"  class='media-finder' data-trix-custom="media-finder">
                           </div>
                           <p class="text-center"><a href="#" class='media-more-link'>More</a></p>
                         </div>`
     this.dialogsElement.insertAdjacentHTML("beforeend", dialogHTML)
   }

   eventListenerForMediaButton(){
     this.toolbarElement.querySelector('[data-trix-action="media"]').addEventListener("click", e => {
       this.showmedia(e)
     })
   }

   showmedia(e){
     if (event.target.classList.contains("trix-active")) {
       event.target.classList.remove("trix-active");
       this.mediaDialog().classList.remove("trix-active");
       delete this.mediaDialog().dataset.trixActive;
       this.mediaInput().setAttribute("disabled", "disabled");
     } else {
       event.target.classList.add("trix-active");
       this.mediaDialog().classList.add("trix-active");
       this.mediaDialog().dataset.trixActive = "";
       this.mediaInput().removeAttribute("disabled");
       this.mediaInput().focus();

       this.listmedia()
           // this.eventListenerForMediaChosen()
     }
   }

   mediaDialog(){
    return  this.dialogsElement.querySelector('[data-trix-dialog="media"]')
   }

   mediaInput(){
     return this.dialogsElement.querySelector('.media-search-input')
   }

   eventListenerForMediaSearch(){
     this.toolbarElement.querySelector('.media-search').addEventListener("click", e => {
       this.listmedia()
     })
   }

   eventListenerForMediaMoreButton(){
     this.toolbarElement.querySelector('.media-more-link').addEventListener("click", e => {
       e.preventDefault()
       fetch(`/admin/medias/search?offset=${this.offset}&q[name_cont]=${this.mediaInput().value}&commit=Search`)
         .then(response => response.json())
         .then(data => {
           this.mediaPlace().innerHTML += data["content"]
           this.offset = this.offset + 40
          this.checkMediaCount(data["count"])
         })
     })
   }

   listmedia(){
     fetch(`/admin/medias/search?offset=0&q[name_cont]=${this.mediaInput().value}&commit=Search`)
       .then(response => response.json())
       .then(data => {
         this.mediaPlace().innerHTML = data["content"]
         this.offset = 40
         this.checkMediaCount(data["count"])
       })
   }

   mediaPlace(){
     return this.mediaDialog().querySelector('[data-trix-custom="media-finder"]')
   }

   setmedia(id){
      let _this = this
      Rails.ajax({
        type: 'GET',
        url: `/admin/medias/${id}/attachment`,
        success: ({content, sgid}) => {
          const attachment = new Trix.Attachment({content, sgid})
          _this.element.editor.insertAttachment(attachment)
          _this.element.editor.insertLineBreak()
        }
      })
   }

   checkMediaCount(count){
     if (count < this.offset){
      this.toolbarElement.querySelector('.media-more-link').classList.add('hide')
     }
   }

  //////////////// UTILS ////////////////////////////////////////////////////

  get buttonGroupBlockTools() {
   return this.toolbarElement.querySelector("[data-trix-button-group=block-tools]")
 }

 get buttonGroupTextTools() {
   return this.toolbarElement.querySelector("[data-trix-button-group=text-tools]")
 }

 get buttonGroupFileTools(){
   return this.toolbarElement.querySelector("[data-trix-button-group=file-tools]")
 }

 get dialogsElement() {
   return this.toolbarElement.querySelector("[data-trix-dialogs]")
 }

 get toolbarElement() {
    return this.element.toolbarElement
  }
}

function addHeadingAttributes() {
  Array.from(["h1", "h2", "h3", "h4", "h5", "h6"]).forEach((tagName, i) => {
    Trix.config.blockAttributes[`heading${(i + 1)}`] = { tagName: tagName, terminal: true, breakOnReturn: true, group: false }
  })
}
