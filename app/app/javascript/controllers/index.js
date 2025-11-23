// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import DropdownController from "controllers/dropdown_controller"
import ConfirmModalController from "controllers/confirm_modal_controller"
import ReviewModalController from "controllers/review_modal_controller"

eagerLoadControllersFrom("controllers", application)

// Ensure dropdown controller is registered even if manifest isn't refreshed yet
application.register("dropdown", DropdownController)
application.register("confirm-modal", ConfirmModalController)
application.register("review-modal", ReviewModalController)
