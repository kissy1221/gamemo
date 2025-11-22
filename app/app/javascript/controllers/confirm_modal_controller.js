import { Controller } from "@hotwired/stimulus"

const OVERLAY_SHOW_CLASSES = ["opacity-100"]
const OVERLAY_HIDE_CLASSES = ["opacity-0"]
const DIALOG_SHOW_CLASSES = ["opacity-100", "translate-y-0", "scale-100"]
const DIALOG_HIDE_CLASSES = ["opacity-0", "translate-y-4", "scale-95"]

export default class extends Controller {
  static targets = ["overlay", "dialog"]

  open(event) {
    event.preventDefault()
    clearTimeout(this.hideTimeout)

    this.overlayTarget.classList.remove("hidden")

    // Ensure animation starts from hidden state by waiting one frame
    requestAnimationFrame(() => {
      this.overlayTarget.classList.remove(...OVERLAY_HIDE_CLASSES)
      this.overlayTarget.classList.add(...OVERLAY_SHOW_CLASSES)

      this.dialogTarget.classList.remove(...DIALOG_HIDE_CLASSES)
      this.dialogTarget.classList.add(...DIALOG_SHOW_CLASSES)
    })
  }

  close(event) {
    event?.preventDefault()

    this.overlayTarget.classList.remove(...OVERLAY_SHOW_CLASSES)
    this.overlayTarget.classList.add(...OVERLAY_HIDE_CLASSES)

    this.dialogTarget.classList.remove(...DIALOG_SHOW_CLASSES)
    this.dialogTarget.classList.add(...DIALOG_HIDE_CLASSES)

    this.hideTimeout = setTimeout(() => {
      this.overlayTarget.classList.add("hidden")
    }, 200)
  }

  stop(event) {
    event.stopPropagation()
  }
}

