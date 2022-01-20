import "trix"
var Trix = require("trix");


// Trix.config.blockAttributes.heading1 = { tagName: 'h1', terminal: true, group: false };
// Trix.config.blockAttributes.heading2 = { tagName: 'h2', terminal: true, group: false };
// Trix.config.blockAttributes.heading3 = { tagName: 'h3', terminal: true, group: false };
// Trix.config.blockAttributes.heading4 = { tagName: 'h4', terminal: true, group: false };

// Trix.config.textAttributes.u = { tagName: 'u'};

// Trix.config.blockAttributes.heading2 = {
//   tagName: "h2", terminal: true, breakOnReturn: true, group: false }
// Trix.config.blockAttributes.heading3 = {
//   tagName: "h3", terminal: true, breakOnReturn: true, group: false }
// Trix.config.blockAttributes.heading4 = {
//   tagName: "h4", terminal: true, breakOnReturn: true, group: false }


Trix.config.textAttributes.underline = {
     style: { "textDecoration": "underline" },
     inheritable: true,
     parser: function(element) {
       var style = window.getComputedStyle(element);
       return style.textDecoration === "underline";
     }
   }


/* insert the button visual in the default toolbar */
addEventListener("trix-initialize", function(event) {
    // var buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="red">RED</button>'
    //
    // event.target.toolbarElement.
    // querySelector(".trix-button-group").
    // insertAdjacentHTML("beforeend", buttonHTML)

    var buttonHTML = '<button type="button" class="underline trix-button" data-trix-attribute="underline" title="underline">U</button>'
    event.target.toolbarElement.querySelector(".trix-button-group--text-tools").
    insertAdjacentHTML("beforeend", buttonHTML)

    // var buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading1">h1</button>'
    // event.target.toolbarElement.querySelector(".trix-button-group").
    // insertAdjacentHTML("beforeend", buttonHTML)
    //
    // var buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="mark">mark</button>'
    // event.target.toolbarElement.querySelector(".trix-button-group").
    // insertAdjacentHTML("beforeend", buttonHTML)
    //
    // var buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading2">h2</button>'
    // event.target.toolbarElement.
    // querySelector(".trix-button-group").
    // insertAdjacentHTML("beforeend", buttonHTML)
    //
    // var buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading3">h3</button>'
    // event.target.toolbarElement.
    // querySelector(".trix-button-group").
    // insertAdjacentHTML("beforeend", buttonHTML)
    //
    // var buttonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading4">h4</button>'
    // event.target.toolbarElement.
    // querySelector(".trix-button-group").
    // insertAdjacentHTML("beforeend", buttonHTML)
    //
    // var buttonHTML = '<a href="/admin/medias"  class="trix-button" data-trix-attribute="image" data-bs-toggle="modal" data-bs-target="#mediapickerModal">image</a>'
    // event.target.toolbarElement.
    // querySelector(".trix-button-group--file-tools").
    // insertAdjacentHTML("beforeend", buttonHTML)

    // var buttonHTML = '<a href="embed_link" type="button" class="trix-button " data-trix-attribute="embed" data-bs-toggle="modal" data-bs-target="#embedModal">embed</a>'
    // event.target.toolbarElement.
    // querySelector(".trix-button-group--file-tools").
    // insertAdjacentHTML("beforeend", buttonHTML)
})
