module SportsHelper
  SPORT_ICONS = {
    "Weight Training": "fa-dumbbell",
    "Bodyweight Training": "fa-person",
    "CrossFit": "fa-fire",
    "Running": "fa-person-running",
    "Cycling": "fa-bicycle",
    "Swimming": "fa-person-swimming",
    "Rowing": "fa-water",
    "Walking": "fa-person-walking",
    "Boxing": "fa-hand-fist",
    "Football (Soccer)": "fa-futbol",
    "Basketball": "fa-basketball",
    "Tennis": "fa-table-tennis-paddle-ball",
    "Rugby": "fa-football",
    "Yoga": "fa-spa",
    "Pilates": "fa-heart-pulse"
  }

  def sport_icon(sport)
    SPORT_ICONS[sport]
  end
end
