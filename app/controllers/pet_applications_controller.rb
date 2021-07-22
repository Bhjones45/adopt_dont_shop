class PetApplicationsController < ApplicationController
  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    PetApplication.create(pet: pet, application: application)

    redirect_to "/applications/#{application.id}"
  end

  def update
    @application = Application.find(params[:application_id])
    pet_apps = PetApplication.finds_application(params[:pet_id], params[:application_id])
    pets = PetApplication.finds_pets(params[:pet_id], params[:application_id])
    pet_apps.update(:status => params[:status_update])

    if @application.all_pets_approved?
      pets.each do |pet|
        pet.toggle_adoptable
      end
      @application.update(status: "Approved")
    end

    if @application.pets_rejected?
      @application.update(status: "Rejected")
    end

    redirect_to "/admin/applications/#{@application.id}"
  end
end
