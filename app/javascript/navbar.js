document.addEventListener("turbo:load", function () {
  const mobileMenuButton = document.getElementById("mobile-menu-button");
  const mobileMenu = document.getElementById("mobile-menu");

  if (mobileMenuButton && mobileMenu) {
    mobileMenuButton.addEventListener("click", function () {
      const isExpanded = mobileMenu.classList.contains("open");

      if (isExpanded) {
        mobileMenu.classList.remove("open");
        setTimeout(() => mobileMenu.classList.add("hidden"), 300);
      } else {
        mobileMenu.classList.remove("hidden");
        void mobileMenu.offsetHeight;
        mobileMenu.classList.add("open");
      }

      const icon = this.querySelector("i");
      if (icon) {
        icon.classList.toggle("fa-bars");
        icon.classList.toggle("fa-times");
      }
    });
  }
});
