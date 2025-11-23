import { Controller } from "@hotwired/stimulus"

const OVERLAY_SHOW_CLASSES = ["opacity-100"]
const OVERLAY_HIDE_CLASSES = ["opacity-0"]
const DIALOG_SHOW_CLASSES = ["opacity-100", "translate-y-0", "scale-100"]
const DIALOG_HIDE_CLASSES = ["opacity-0", "translate-y-4", "scale-95"]

export default class extends Controller {
  static targets = ["overlay", "dialog", "form", "scoreSlider", "scoreDisplay"]

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

  updateScore(event) {
    const value = parseInt(event.target.value)
    if (this.hasScoreDisplayTarget) {
      this.scoreDisplayTarget.textContent = value
      this.updateScoreColor(value)
    }
    if (this.hasScoreSliderTarget) {
      this.updateSliderColor(value)
    }
  }

  updateScoreColor(score) {
    if (!this.hasScoreDisplayTarget) return
    
    const display = this.scoreDisplayTarget
    display.classList.remove("bg-red-500", "bg-yellow-400", "bg-green-500", "bg-gray-400")
    
    if (score < 50) {
      display.classList.add("bg-red-500")
    } else if (score < 80) {
      display.classList.add("bg-yellow-400")
    } else {
      display.classList.add("bg-green-500")
    }
  }

  updateSliderColor(score) {
    if (!this.hasScoreSliderTarget) return
    
    const slider = this.scoreSliderTarget
    // 常に赤→黄→緑のグラデーション（50点で黄色、80点で緑に変わる）
    const red = "#ef4444"
    const yellow = "#fbbf24"
    const green = "#10b981"
    
    // 50点で黄色、80点で緑に変わるグラデーション
    slider.style.background = `linear-gradient(to right, ${red} 0%, ${red} 50%, ${yellow} 50%, ${yellow} 80%, ${green} 80%, ${green} 100%)`
  }

  setScore(event) {
    const score = parseInt(event.currentTarget.dataset.score)
    if (this.hasScoreSliderTarget) {
      this.scoreSliderTarget.value = score
      this.updateScore({ target: this.scoreSliderTarget })
    }
  }

  connect() {
    // Initialize score display and slider color
    if (this.hasScoreSliderTarget && this.hasScoreDisplayTarget) {
      const initialValue = parseInt(this.scoreSliderTarget.value) || 50
      this.scoreSliderTarget.value = initialValue
      // Set initial slider color
      this.updateSliderColor(initialValue)
      this.updateScore({ target: this.scoreSliderTarget })
    }
  }

  close(event) {
    event?.preventDefault()

    this.overlayTarget.classList.remove(...OVERLAY_SHOW_CLASSES)
    this.overlayTarget.classList.add(...OVERLAY_HIDE_CLASSES)

    this.dialogTarget.classList.remove(...DIALOG_SHOW_CLASSES)
    this.dialogTarget.classList.add(...DIALOG_HIDE_CLASSES)

    this.hideTimeout = setTimeout(() => {
      this.overlayTarget.classList.add("hidden")
      // Reset form when closing
      if (this.hasFormTarget) {
        this.formTarget.reset()
      }
    }, 200)
  }

  stop(event) {
    event.stopPropagation()
  }
}

