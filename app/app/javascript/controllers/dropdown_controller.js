import { Controller } from "@hotwired/stimulus"

// Handles simple dropdown toggling for navigation menus
export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    this.handleOutsideClick = this.handleOutsideClick.bind(this)
  }

  toggle(event) {
    event.preventDefault()

    if (this.menuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.menuTarget.classList.remove("hidden")
    this.buttonTarget?.setAttribute("aria-expanded", "true")
    this.attachOutsideClick()
  }

  close() {
    if (this.menuTarget.classList.contains("hidden")) {
      this.detachOutsideClick()
      return
    }

    this.menuTarget.classList.add("hidden")
    this.buttonTarget?.setAttribute("aria-expanded", "false")
    this.detachOutsideClick()
  }

  handleOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  disconnect() {
    this.detachOutsideClick()
  }

  attachOutsideClick() {
    if (this.listeningOutsideClick) return

    this.listeningOutsideClick = true
    document.addEventListener("click", this.handleOutsideClick)
  }

  detachOutsideClick() {
    if (!this.listeningOutsideClick) return

    this.listeningOutsideClick = false
    document.removeEventListener("click", this.handleOutsideClick)
  }
}

