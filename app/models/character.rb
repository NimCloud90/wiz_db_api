class Character < ApplicationRecord
  belongs_to :player


  validates :name, presence: true
  validates :role, presence: true
  validates :perstat, presence: true
  validates :agstat, presence: true
  validates :intstat, presence: true
  validates :chastat, presence: true
end
