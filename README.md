to create i made:
rails new bootstrap_demo -j esbuild --css bootstrap
yarn add bootstrap-icons
rails generate simple_form:install
rails generate devise:views


to run
bin/dev


#"./bin/build-css"


editor:
need decent link selector
need image picker
need embeds to work for eg youtube

https://github.com/rails/actiontext/issues/37
https://jumpstartrails.com/discussions/205
https://editorjs.io/

https://medium.com/@kristina.kabosiene/manual-upload-rails-6-active-storage-tinymce-5-and-aws-s3-2f139c0b5df4

https://jsfiddle.net/javan/z66gzbcp/3/
https://dev.to/sowenjub/auto-linking-urls-with-trix-editor-and-stimulusjs-4gh8
https://jsfiddle.net/javan/hapxyn5o/

https://github.com/excid3/railsconf-2020-actiontext/blob/master/app/javascript/youtube.js

https://stackoverflow.com/questions/61241745/cant-render-youtube-embed-iframe-with-rails-6-actiontext
https://stackoverflow.com/questions/61867995/how-to-embed-an-iframe-with-actiontext-trix-on-ruby-on-rails?rq=1
https://stackoverflow.com/questions/56316549/how-to-display-embed-video-with-actiontext
myDialogHtml =
    '<div class="trix-dialog trix-dialog--link" data-trix-dialog="myDialog" data-trix-dialog-attribute="src">
        <div class="dialog-content">
           <div class="trix-dialog__link-fields">
            <input type="url" name="src" class="trix-input trix-input--dialog" placeholder="Enter a URL…" required="" data-trix-input="" disabled="disabled">
            <div class="trix-button-group">
              <input type="button" class="trix-button trix-button--dialog" value="Insert" data-trix-method="makeAttachment">
            </div>
          </div>
        </div>
      </div>';
  dialogElement = event.target.toolbarElement.querySelector(".trix-dialogs");
  dialogElement.insertAdjacentHTML("beforeend", myDialogHtml);




  let attachment = new Trix.Attachment({
    sgid: media.sgid,
    content: media.content
    })
  this.editor.instertAttachment(attachment)

https://thoughtbot.com/blog/full-text-search-with-postgres-and-action-text
https://github.com/basecamp/trix/issues/55
https://github.com/basecamp/trix/issues/952
https://stackoverflow.com/questions/70928088/add-attributes-to-actiontext-trix-attachment

https://github.com/excid3/railsconf-2020-actiontext/blob/master/app/models/youtube.rb


render different in editor
allow target (its allowed in rails.  but not trix)
how can i add target
add attributes to attachment
use attributes in partial
use embed gem https://github.com/ruby-oembed/ruby-oembed
