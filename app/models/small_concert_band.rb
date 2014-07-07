class SmallConcertBand < ActiveRecord::Base
  validates :name, presence: true
  validates :song, presence: true
  validates :leader, presence: true
  validates :year, presence: true,
    numericality: {only_integer: true, greater_then: 2000}
  validates :month, presence: true,
    numericality: {only_integer: true, greater_then: 1, less_than: 13}
end
