import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    this.timeout = 4000
    this.messageTargets.forEach((el, index) => {
      // Stagger removal slightly for multiple messages
      const delay = this.timeout + index * 200
      setTimeout(() => this.hide(el), delay)
    })
  }

  hide(el) {
    el.classList.add('flash-hidden')
    // remove from DOM after transition
    setTimeout(() => el.remove(), 300)
  }
}
