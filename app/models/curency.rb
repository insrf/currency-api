class Curency < ApplicationRecord
  validates :name, :rate, presence: true
end
