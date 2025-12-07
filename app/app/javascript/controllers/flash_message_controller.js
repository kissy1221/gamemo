import { Controller } from "@hotwired/stimulus"

// Handles flash message display with slide-in animation from top-right
export default class extends Controller {
  connect() {
    // Show message with animation after a short delay
    this.showMessage()
    
    // Auto-hide after 5 seconds
    this.timeout = setTimeout(() => {
      this.hideMessage()
    }, 5000)
  }

  showMessage() {
    // Trigger animation by removing initial hidden state
    requestAnimationFrame(() => {
      this.element.classList.remove("opacity-0", "translate-x-full")
      this.element.classList.add("opacity-100", "translate-x-0")
    })
  }

  hideMessage() {
    // Animate out
    this.element.classList.remove("opacity-100", "translate-x-0")
    this.element.classList.add("opacity-0", "translate-x-full")
    
    // Remove from DOM after animation
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }

  close(event) {
    event.preventDefault()
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
    this.hideMessage()
  }

  disconnect() {
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }
}

