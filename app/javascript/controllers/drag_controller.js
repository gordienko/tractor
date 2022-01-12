import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      animation: 150,
      onEnd: this.end.bind(this),
      handle: '.handle'
    })
  }

  end(event) {
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}
