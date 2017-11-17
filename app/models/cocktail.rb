class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses, inverse_of: :cocktail, dependent: :destroy
  has_many :ingredients, through: :doses
  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true

  mount_uploader :photo, PhotoUploader
end
