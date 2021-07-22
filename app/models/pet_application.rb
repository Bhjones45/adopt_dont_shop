class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  def self.finds_application(pet_id, application_id)
    pet_apps = where("pet_id = #{pet_id} and application_id = #{application_id}").first
  end

  def self.finds_pets(pet_id, application_id)
    pet_apps = where("pet_id = #{pet_id} and application_id = #{application_id}").first.application.pets
  end
end
