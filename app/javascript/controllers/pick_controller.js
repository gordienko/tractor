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
  }
}
