require 'rails_helper'

RSpec.describe 'admin application show page' do
  before(:each) do
    @shelter = Shelter.create!(name:'Boise Shelter', city: 'Boise', foster_program: false, rank: 7)
    @pet = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: @shelter.id)
    @application_1 = Application.create!(name: "Taylor Hammond", street_address: "5234 Broadway Avenue", city: "Dallas", state: "Texas", zip_code: '86754', description: "I am very good person", status: "Pending")
    @application_2 = Application.create!(name: "Drew Sollars", street_address: "1432 Main Street", city: "Columbus", state: "Ohio", zip_code: '87456', description: "I will bathe them often", status: "Pending")
    @pet_application = PetApplication.create!(pet: @pet, application: @application_1)
  end

  it 'shows the application and attributes' do
    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_content(@application_1.name)
    expect(page).to have_content(@application_1.street_address)
    expect(page).to have_content(@application_1.city)
    expect(page).to have_content(@application_1.state)
    expect(page).to have_content(@application_1.zip_code)
    expect(page).to have_content(@application_1.status)
  end

  it 'displays pets on application' do
    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_button("Approve")
    expect(page).to have_content(@pet.name)
  end

  it 'can approve application to certain pet' do
    # pet_2 = Pet.create!(adoptable: true, age: 2, breed: 'Bulldog', name: 'Butch', shelter_id: @shelter.id)
    # PetApplication.create!(pet: pet_2, application: @application_1)

    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_content("Pending")

    click_button "Approve"

    expect(page).to have_content("Approved")
  end

  it 'can reject application to a certain pet' do
    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_content("Pending")

    click_button "Reject"

    expect(page).to have_content("Rejected")
  end
end
