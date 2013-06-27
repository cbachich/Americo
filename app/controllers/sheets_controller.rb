class SheetsController < ApplicationController
  def about
    @sheet = Sheet.find_by_name("about") 
    @title   = @sheet.title
    @summary = @sheet.subtitle
  end

  def services
    @sheet = Sheet.find_by_name("services") 
    @title   = @sheet.title
    @summary = @sheet.subtitle
  end
end
