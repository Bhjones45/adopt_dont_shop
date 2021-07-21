class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications, dependent: :destroy

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true

  def all_pets_approved?
    pet_applications.all? do |application|
      application.status == "Approved"
    end
  end

  def pets_rejected?
    pet_applications.any? do |application|
      application.status == "Rejected"
    end
  end
end
