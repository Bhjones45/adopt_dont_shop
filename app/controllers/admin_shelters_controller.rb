class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.order_by_reverse_alphabetical
    @pending = Shelter.order_alphabetically.order_alphabetically
  end
end
