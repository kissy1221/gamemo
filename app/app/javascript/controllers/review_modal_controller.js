import { Controller } from "@hotwired/stimulus"

const OVERLAY_SHOW_CLASSES = ["opacity-100"]
const OVERLAY_HIDE_CLASSES = ["opacity-0"]
const DIALOG_SHOW_CLASSES = ["opacity-100", "translate-y-0", "scale-100"]
const DIALOG_HIDE_CLASSES = ["opacity-0", "translate-y-4", "scale-95"]

export default class extends Controller {
  static targets = ["overlay", "dialog", "form", "scoreSlider", "scoreDisplay", "platformSelect", "titleInput", "bodyInput", "isPublicInput", "submitButton"]

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
        // 新規作成モードに戻す
        this.resetToCreateMode()
      }
    }, 200)
  }

  stop(event) {
    event.stopPropagation()
  }

  async onPlatformChange(event) {
    const gamePlatformId = event.target.value
    if (!gamePlatformId) {
      // プラットフォームが選択されていない場合は新規作成モードに戻す
      this.resetToCreateMode()
      return
    }

    const gameId = event.target.dataset.gameId
    if (!gameId) return

    try {
      // 既存レビューを取得
      const response = await fetch(`/games/${gameId}/reviews/check?game_platform_id=${gamePlatformId}`, {
        method: "GET",
        headers: {
          "Accept": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')?.content || ""
        },
        credentials: "same-origin"
      })

      if (response.ok) {
        const data = await response.json()
        if (data.review) {
          // 既存レビューがある場合は更新モードに切り替え
          this.loadExistingReview(data.review)
        } else {
          // 既存レビューがない場合は新規作成モード
          this.resetToCreateMode()
        }
      } else {
        // エラー時は新規作成モードに戻す
        this.resetToCreateMode()
      }
    } catch (error) {
      console.error("Failed to check existing review:", error)
      // エラー時は新規作成モードに戻す
      this.resetToCreateMode()
    }
  }

  loadExistingReview(review) {
    // フォームの各フィールドに既存レビューの値を設定
    if (this.hasTitleInputTarget) {
      this.titleInputTarget.value = review.title || ""
    }
    if (this.hasBodyInputTarget) {
      this.bodyInputTarget.value = review.body || ""
    }
    if (this.hasScoreSliderTarget) {
      const score = review.score || 50
      this.scoreSliderTarget.value = score
      this.updateScore({ target: this.scoreSliderTarget })
    }
    if (this.hasIsPublicInputTarget) {
      this.isPublicInputTarget.checked = review.is_public || false
    }

    // フォームのURLとメソッドを更新用に変更
    if (this.hasFormTarget) {
      this.formTarget.action = `/reviews/${review.id}`
      this.formTarget.method = "post"
      // Railsの_methodパラメータを追加（PATCHリクエストのため）
      let methodInput = this.formTarget.querySelector('input[name="_method"]')
      if (!methodInput) {
        methodInput = document.createElement("input")
        methodInput.type = "hidden"
        methodInput.name = "_method"
        this.formTarget.appendChild(methodInput)
      }
      methodInput.value = "patch"
    }

    // 送信ボタンのテキストを変更
    if (this.hasSubmitButtonTarget) {
      this.submitButtonTarget.textContent = "更新する"
    }
  }

  resetToCreateMode() {
    // フォームの各フィールドをクリア
    if (this.hasTitleInputTarget) {
      this.titleInputTarget.value = ""
    }
    if (this.hasBodyInputTarget) {
      this.bodyInputTarget.value = ""
    }
    if (this.hasScoreSliderTarget) {
      const defaultScore = 50
      this.scoreSliderTarget.value = defaultScore
      this.updateScore({ target: this.scoreSliderTarget })
    }
    if (this.hasIsPublicInputTarget) {
      this.isPublicInputTarget.checked = false
    }

    // フォームのURLとメソッドを新規作成用に戻す
    if (this.hasFormTarget) {
      const gameId = this.platformSelectTarget?.dataset.gameId
      if (gameId) {
        this.formTarget.action = `/games/${gameId}/reviews`
        this.formTarget.method = "post"
        // _methodパラメータを削除
        const methodInput = this.formTarget.querySelector('input[name="_method"]')
        if (methodInput) {
          methodInput.remove()
        }
      }
    }

    // 送信ボタンのテキストを戻す
    if (this.hasSubmitButtonTarget) {
      this.submitButtonTarget.textContent = "投稿する"
    }
  }
}

