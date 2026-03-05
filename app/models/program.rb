class Program < ApplicationRecord
  belongs_to :user
  has_many :weeks
  has_one :chat

  LEVELS = ["Debutant", "Intermediate", "Confirmed", "Expert"]
  SPORTS = ["Weight Training",
            "Bodyweight Training",
            "CrossFit",
            "Running",
            "Cycling",
            "Swimming",
            "Rowing",
            "Walking",
            "Boxing",
            "Football (Soccer)",
            "Basketball",
            "Tennis",
            "Rugby",
            "Yoga",
            "Pilates"]

  validates :number_of_week, :level, :goal, :sport, presence: true

  validates :level, inclusion: { in: LEVELS }

  validates :sport, inclusion: { in: SPORTS }

  validates :number_of_week, numericality: { greater_than: 0, less_or_equal_to: 18 }
end
