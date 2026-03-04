class Week < ApplicationRecord
  belongs_to :program, dependant: destroy
end
