class Material < ApplicationRecord
  belongs_to :recipe

  validates :number, numericality: :true
  validates :number, presence: true, if: :unit?
  validates :unit, presence: true, if: :number?
end
