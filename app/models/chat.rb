class Chat < ApplicationRecord
  belongs_to :program, dependent: :destroy
  has_one :user, through: :program
end
