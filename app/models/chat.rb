class Chat < ApplicationRecord
  belongs_to :program, dependant: :destroy
  has_one :user, through: :program
end
