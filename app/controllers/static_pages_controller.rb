class StaticPagesController < ApplicationController

  before_filter :signed_in_admin, 
    only: [:admin, 
           :admin_home, 
           :admin_about, 
           :admin_services]

  def home
  end

  def admin
    @title = "Website Setup"
    @summary = "Customize your website"
    @is_admin_page = true
  end

  def admin_home
    @title = "Home Page Setup"
    @summary = "Edit the home page to your liking"
    @is_admin_page = true
  end

  def admin_about
    @sheet = Company.first.sheets.find_by_name("about")
    @title = "About Page Setup"
    @summary = "Edit the about page to your liking"
    @is_admin_page = true
    render '/static_pages/admin_sheet.html.erb'
  end

  def admin_services
    @sheet = Company.first.sheets.find_by_name("services")
    @title = "Services Page Setup"
    @summary = "Edit the services page to your liking"
    @is_admin_page = true
    render '/static_pages/admin_sheet.html.erb'
  end

  def company_change
    company = Company.first
    company.title = params[:title]
    company.phone = params[:phone]
    company.fax   = params[:fax]
    save_and_redirect(company)
  end

  def home_change
    description = Company.first.description
    description.title = params[:description]
    description.body = params[:comments]
    save_and_redirect(description)
  end

  def sheet_change
    sheet = Company.first.sheets.find_by_name(params[:name])

    # Start by grabbing each pages contents
    sheet.pages.each do |page|
      name = page.name
      page.name  = params["#{name}_name"]
      page.title = params["#{name}_title"]
      return unless save_or_redirect(page)

      page.description.title = params["#{name}_subtitle"]
      page.description.short_body = params["#{name}_shortbody"]
      page.description.body = params["#{name}_body"]
      return unless save_or_redirect(page.description)

      page.pictures.each do |pic|
        pic.description.title = params["#{pic.id}_title"]
        pic.description.body = params["#{pic.id}_subtitle"]
        return unless save_or_redirect(pic.description)
      end
    end

    # Then save the subtitle
    sheet.description.body = params[:subtitle]
    save_and_redirect(sheet.description)
  end

  private

    def signed_in_admin
      if !admin_signed_in?
        flash[:warning] = "Admin not signed in"
        redirect_to(root_path)
      end
    end

    def save_or_redirect(object)
      if !object.save
        flash[:error] = "Errors occurred during save"
        redirect_to :back
        false
      else
        true
      end
    end

    def save_and_redirect(object)
      if object.save
        flash[:success] = "Saved Changes"
      else
        flash[:error] = "Errors occured during save"
      end
      redirect_to :back
    end
end
