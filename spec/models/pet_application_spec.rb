require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe "relationships" do
    it {should belong_to :application}
    it {should belong_to :pet}
  end

  describe "class methods" do
    it '::finds_application' do
      shelter = Shelter.create!(name:'Boise Shelter', city: 'Boise', foster_program: false, rank: 7)
      pet = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: shelter.id)
      application = Application.create!(name: "Taylor Hammond", street_address: "5234 Broadway Avenue", city: "Dallas", state: "Texas", zip_code: '86754', description: "I am very good person", status: "Pending")
      pet_application = PetApplication.create!(pet: pet, application: application)

      expect(PetApplication.finds_application(pet.id, application.id)).to eq(pet_application)
    end

    it '::finds_pets' do
      shelter = Shelter.create!(name:'Boise Shelter', city: 'Boise', foster_program: false, rank: 7)
      pet = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: shelter.id)
      application = Application.create!(name: "Taylor Hammond", street_address: "5234 Broadway Avenue", city: "Dallas", state: "Texas", zip_code: '86754', description: "I am very good person", status: "Pending")
      pet_application = PetApplication.create!(pet: pet, application: application)

      expect(PetApplication.finds_pets(pet.id, application.id)).to eq([pet])
    end
  end
end
