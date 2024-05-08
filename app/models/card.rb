class Card < ApplicationRecord
  validates :name, presence: true
  validates :rarity, presence: true
end
