class SheetsController < ApplicationController
  def show
    @sheet = Sheet.find_by_name(params[:name].downcase) 
  end
end
