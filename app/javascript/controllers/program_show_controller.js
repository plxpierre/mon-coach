import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["contentPane", "backToTop", "weekStep", "weekSection"];


  connect() {
    // Crée l'observer
    this.observer = new IntersectionObserver(
      (entries) => this.handleIntersect(entries),
      {
        root: null, // null = viewport
        threshold: 0.5, // déclenche quand 10% de l'élément est visible
      },
    );

    // Observe chaque target
    this.weekSectionTargets.forEach((section) =>
      this.observer.observe(section),
    );
  }

  handleIntersect(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.weekStepTargets.forEach((step) => {
          if (step.dataset.target < entry.target.id) { return }
          const isActive = step.dataset.target === entry.target.id;
          step.classList.toggle("step-primary", isActive);
        });
        // Tu peux déclencher une action ici, ex: ajouter une classe
        // entry.target.classList.add("visible");
      } else {
        // entry.target.classList.remove("visible");
      }
    });
  }
}
