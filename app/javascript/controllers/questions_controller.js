import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["slide", "flash"]
    initialize() {
        this.index = 0
        this.showCurrentSlide()
        this.flashTarget.hidden = true
    }

    next() {
        let answer = document.getElementsByName(`[answers][${this.index}]`)
        if (Object.values(answer).filter(options => options.checked).length > 0) {
            this.index++
            this.showCurrentSlide()
            this.flashTarget.hidden = true

        } else {
            this.flashTarget.hidden = false
        }
    }

    previous() {
        this.index--
        this.showCurrentSlide()
        this.flashTarget.hidden = true
    }

    showCurrentSlide() {
        this.slideTargets.forEach((element, index) => {
            element.hidden = index !== this.index
        })
    }

    submit() {
        if (document.getElementById("questionnaire").checkValidity())
            this.flashTarget.hidden = true
        else
            this.flashTarget.hidden = false
    }
}
