class Week < ApplicationRecord
  belongs_to :program, dependent: :destroy
end
