import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [
    "stepperPanel",
    "stepperPlaceholder",
    "backToTop",
    "weekStep",
    "weekSection"
  ]

  connect() {

    this.onScroll = this.onScroll.bind(this)
    this.followScroll = this.followScroll.bind(this)

    this.highlightCurrentWeek()
    this.toggleBackToTop()
    this.followScroll()

    window.addEventListener("scroll", this.onScroll, { passive: true })
    window.addEventListener("resize", this.followScroll)
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
    window.removeEventListener("resize", this.followScroll)
  }

  // -------------------------
  // Scroll management
  // -------------------------

  onScroll() {
    this.highlightCurrentWeek()
    this.toggleBackToTop()
    this.followScroll()
  }

  // -------------------------
  // Smooth anchor jump
  // -------------------------

  jump(event) {
    event.preventDefault()

    const id = event.currentTarget.getAttribute("href")
    const target = document.querySelector(id)

    if (!target) return

    target.scrollIntoView({
      behavior: "smooth",
      block: "start"
    })
  }

  // -------------------------
  // Highlight active week
  // -------------------------

  highlightCurrentWeek() {

    if (!this.hasWeekSectionTarget) return

    const scrollY = window.scrollY
    const offset = 140

    let currentId = this.weekSectionTargets[0]?.id

    this.weekSectionTargets.forEach(section => {

      const top = section.getBoundingClientRect().top + scrollY

      if (scrollY + offset >= top) {
        currentId = section.id
      }

    })

    this.weekStepTargets.forEach(step => {

      const isActive = step.dataset.target === currentId
      step.classList.toggle("step-primary", isActive)

    })

  }

  // -------------------------
  // Back to top button
  // -------------------------

  toggleBackToTop() {

    if (!this.hasBackToTopTarget) return

    const show = window.scrollY > 400

    this.backToTopTarget.classList.toggle("opacity-0", !show)
    this.backToTopTarget.classList.toggle("pointer-events-none", !show)

  }

  backToTopClick() {

    window.scrollTo({
      top: 0,
      behavior: "smooth"
    })

  }

  // -------------------------
  // Sticky follow panel
  // -------------------------

  followScroll() {

    if (!this.hasStepperPanelTarget) return

    const panel = this.stepperPanelTarget
    const placeholder = this.stepperPlaceholderTarget

    const isDesktop = window.matchMedia("(min-width: 1024px)").matches

    if (!isDesktop) {

      this.unfixPanel()
      return

    }

    const navOffset = 112
    const rect = panel.getBoundingClientRect()

    if (rect.top <= navOffset) {

      placeholder.style.height = panel.offsetHeight + "px"
      placeholder.classList.remove("hidden")

      panel.classList.add("fixed")
      panel.style.top = navOffset + "px"

      panel.style.width =
        placeholder.parentElement.getBoundingClientRect().width + "px"

    } else {

      this.unfixPanel()

    }

  }

  unfixPanel() {

    const panel = this.stepperPanelTarget
    const placeholder = this.stepperPlaceholderTarget

    panel.classList.remove("fixed")
    panel.style.top = ""
    panel.style.width = ""

    placeholder.classList.add("hidden")
    placeholder.style.height = ""

  }

}
