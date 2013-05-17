class SheetsController < ApplicationController
  def about
    @sheet = Sheet.find_by_name("about") 
    @title   = @sheet.description.title
    @summary = @sheet.description.body
  end

  def services
    @sheet = Sheet.find_by_name("services") 
    @title   = @sheet.description.title
    @summary = @sheet.description.body
  end
end
