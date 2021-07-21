class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.order_by_reverse_alphabetical
    @pending_applications = Shelter.has_pending_applications
  end
end
