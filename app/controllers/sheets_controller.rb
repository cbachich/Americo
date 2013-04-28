class SheetsController < ApplicationController
  def show
    @sheet = Sheet.find_by_name(params[:name].downcase) 
    @title   = @sheet.description.title
    @summary = @sheet.description.body
  end
end
