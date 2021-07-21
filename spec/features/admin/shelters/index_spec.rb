require 'rails_helper'

RSpec.describe 'admin shelters index page' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
  end

  it 'displays all shelters in reverse alphabetical order' do
    visit "/admin/shelters"

    expect(@shelter_2.name).to appear_before(@shelter_3.name)
    expect(@shelter_3.name).to appear_before(@shelter_1.name)
    expect(@shelter_2.name).to appear_before(@shelter_1.name)
  end

  # it 'lists shelters with pending applications alphabetically' do
  #   pet_1 = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: @shelter_1.id)
  #   pet_2 = Pet.create!(adoptable: true, age: 1, breed: 'German Shpherd', name: 'Sandy', shelter_id: @shelter_2.id)
  #   application_1 = Application.create!(name: "Taylor Hammond", street_address: "5234 Broadway Avenue", city: "Dallas", state: "Texas", zip_code: '86754', description: "I am very good person", status: "Pending")
  #   application_2 = Application.create!(name: "Drew Sollars", street_address: "1432 Main Street", city: "Columbus", state: "Ohio", zip_code: '87456', description: "I will bathe them often", status: "Pending")
  #
  #   PetApplication.create!(pet: pet_1, application: application_1)
  #   PetApplication.create!(pet: pet_2, application: application_2)
  #
  #   visit "/admin/shelters"
  #   within '#pending-apps'
  #     expect(page).to have_content(@shelter_2.name)
  #     expect(@shelter_1.name).to appear_before(@shelter_2.name)
  # end
end
