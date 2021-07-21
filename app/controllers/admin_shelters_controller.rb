class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.order_by_reverse_alphabetical
    @pending_applications = Shelter.order_alphabetically.has_pending_applications
  end
end
