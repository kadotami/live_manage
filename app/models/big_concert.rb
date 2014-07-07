class BigConcert < ActiveRecord::Base
  validates :year, presence: true,
    numericality: {only_integer: true, greater_then: 2000}
  validates :season, presence: true,
    numericality: {only_integer: true, greater_then: 0, less_than: 4}
end
