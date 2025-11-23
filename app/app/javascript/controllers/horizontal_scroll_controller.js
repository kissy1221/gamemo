import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["scrollContainer", "prevButton", "nextButton"]

  connect() {
    this.updateButtons()
    // スクロール時にボタンの表示状態を更新
    this.scrollContainerTarget.addEventListener("scroll", () => {
      this.updateButtons()
    })
    // リサイズ時にも更新
    window.addEventListener("resize", () => {
      this.updateButtons()
    })
  }

  scrollLeft() {
    // 無効化されている場合は何もしない
    if (this.prevButtonTarget.disabled) return
    
    const container = this.scrollContainerTarget
    const cardElement = container.querySelector(".game-card")
    if (!cardElement) return
    
    const cardWidth = cardElement.offsetWidth
    const gap = 24 // gap-6 = 1.5rem = 24px
    const scrollAmount = cardWidth + gap
    container.scrollBy({ left: -scrollAmount, behavior: "smooth" })
  }

  scrollRight() {
    // 無効化されている場合は何もしない
    if (this.nextButtonTarget.disabled) return
    
    const container = this.scrollContainerTarget
    const cardElement = container.querySelector(".game-card")
    if (!cardElement) return
    
    const cardWidth = cardElement.offsetWidth
    const gap = 24 // gap-6 = 1.5rem = 24px
    const scrollAmount = cardWidth + gap
    container.scrollBy({ left: scrollAmount, behavior: "smooth" })
  }

  updateButtons() {
    const container = this.scrollContainerTarget
    const scrollLeft = container.scrollLeft
    const scrollWidth = container.scrollWidth
    const clientWidth = container.clientWidth
    const maxScroll = scrollWidth - clientWidth

    // 左端にいる場合は左ボタンを無効化（グレーアウト）
    const prevButton = this.prevButtonTarget
    const prevIcon = prevButton.querySelector("svg")
    if (scrollLeft <= 0) {
      prevButton.disabled = true
      prevButton.classList.add("opacity-50", "cursor-not-allowed")
      prevButton.classList.remove("hover:bg-gray-50")
      if (prevIcon) {
        prevIcon.classList.add("text-gray-400")
        prevIcon.classList.remove("text-gray-700")
      }
    } else {
      prevButton.disabled = false
      prevButton.classList.remove("opacity-50", "cursor-not-allowed")
      prevButton.classList.add("hover:bg-gray-50")
      if (prevIcon) {
        prevIcon.classList.remove("text-gray-400")
        prevIcon.classList.add("text-gray-700")
      }
    }

    // 右端にいる場合は右ボタンを無効化（グレーアウト）
    const nextButton = this.nextButtonTarget
    const nextIcon = nextButton.querySelector("svg")
    if (scrollLeft >= maxScroll - 1) {
      nextButton.disabled = true
      nextButton.classList.add("opacity-50", "cursor-not-allowed")
      nextButton.classList.remove("hover:bg-gray-50")
      if (nextIcon) {
        nextIcon.classList.add("text-gray-400")
        nextIcon.classList.remove("text-gray-700")
      }
    } else {
      nextButton.disabled = false
      nextButton.classList.remove("opacity-50", "cursor-not-allowed")
      nextButton.classList.add("hover:bg-gray-50")
      if (nextIcon) {
        nextIcon.classList.remove("text-gray-400")
        nextIcon.classList.add("text-gray-700")
      }
    }
  }
}

