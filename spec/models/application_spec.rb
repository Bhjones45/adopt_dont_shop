require 'rails_helper'

RSpec.describe Application, type: :model do
  describe "relationship" do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
  end

  describe '#instance methods' do
    it '#all_pets_approved?' do
      shelter = Shelter.create!(name:'Boise Shelter', city: 'Boise', foster_program: false, rank: 7)
      pet_1 = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: shelter.id)
      pet_2 = Pet.create!(adoptable: true, age: 2, breed: 'German Shepard', name: 'Daisy', shelter_id: shelter.id)
      application = Application.create!(name: "Taylor Hammond", street_address: "5234 Broadway Avenue", city: "Dallas", state: "Texas", zip_code: '86754', description: "I am very good person", status: "Pending")
      pet_application = PetApplication.create!(pet: pet_1, application: application, status: "Approved")
      pet_application = PetApplication.create!(pet: pet_2, application: application, status: "Approved")

      expect(application.all_pets_approved?).to eq(true)
    end

    it '#pets_rejected?' do
      shelter = Shelter.create!(name:'Boise Shelter', city: 'Boise', foster_program: false, rank: 7)
      pet_1 = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: shelter.id)
      pet_2 = Pet.create!(adoptable: true, age: 2, breed: 'German Shepard', name: 'Daisy', shelter_id: shelter.id)
      application = Application.create!(name: "Taylor Hammond", street_address: "5234 Broadway Avenue", city: "Dallas", state: "Texas", zip_code: '86754', description: "I am very good person", status: "Pending")
      pet_application = PetApplication.create!(pet: pet_1, application: application, status: "Approved")
      pet_application = PetApplication.create!(pet: pet_2, application: application, status: "Rejected")

      expect(application.pets_rejected?).to eq(true)
    end
  end
end
