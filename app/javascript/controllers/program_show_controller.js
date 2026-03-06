import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["contentPane", "backToTop", "weekStep", "weekSection"]

  connect() {
    this.handleScroll = this.handleScroll.bind(this)

    if (this.hasContentPaneTarget) {
      this.contentPaneTarget.addEventListener("scroll", this.handleScroll, { passive: true })
    }

    this.highlightCurrentWeek()
    this.toggleBackToTop()
  }

  disconnect() {
    if (this.hasContentPaneTarget) {
      this.contentPaneTarget.removeEventListener("scroll", this.handleScroll)
    }
  }

  handleScroll() {
    this.highlightCurrentWeek()
    this.toggleBackToTop()
  }

  jump(event) {
    event.preventDefault()

    const id = event.currentTarget.getAttribute("href")
    const target = this.weekSectionTargets.find((section) => `#${section.id}` === id)

    if (!target || !this.hasContentPaneTarget) return

    this.contentPaneTarget.scrollTo({
      top: target.offsetTop - 16,
      behavior: "smooth"
    })
  }

  highlightCurrentWeek() {
    if (!this.hasContentPaneTarget || this.weekSectionTargets.length === 0) return

    const scrollTop = this.contentPaneTarget.scrollTop
    const offset = 475

    let currentId = this.weekSectionTargets[0].id

    this.weekSectionTargets.forEach((section) => {
      if (scrollTop + offset >= section.offsetTop) {
        currentId = section.id
      }
    })

    this.weekStepTargets.forEach((step) => {
      const isActive = step.dataset.target === currentId
      step.classList.toggle("step-primary", isActive)
    })
  }

  toggleBackToTop() {
    if (!this.hasContentPaneTarget || !this.hasBackToTopTarget) return

    const show = this.contentPaneTarget.scrollTop > 300

    this.backToTopTarget.classList.toggle("opacity-0", !show)
    this.backToTopTarget.classList.toggle("pointer-events-none", !show)
  }

  backToTopClick() {
    if (!this.hasContentPaneTarget) return

    this.contentPaneTarget.scrollTo({
      top: 0,
      behavior: "smooth"
    })
  }
}
