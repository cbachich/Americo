class StaticPagesController < ApplicationController
  def home
  end

  def admin
    @title = "Website Setup"
    @summary = "Customize your website"
  end

  def admin_home
    @title = "Home Page Setup"
    @summary = "Edit the home page to your liking"
  end

  def admin_about
    @sheet = Company.first.sheets.find_by_name("about")
    @title = "About Page Setup"
    @summary = "Edit the about page to your liking"
    render '/static_pages/admin_sheet.html.erb'
  end

  def admin_services
    @sheet = Company.first.sheets.find_by_name("services")
    @title = "Services Page Setup"
    @summary = "Edit the services page to your liking"
    render '/static_pages/admin_sheet.html.erb'
  end

  def admin_change
    flash[:notice] = "This worked!"
    redirect_to "/admin"
  end

  def home_change
    flash[:notice] = "This worked!"
    redirect_to '/admin/home'
  end
end
