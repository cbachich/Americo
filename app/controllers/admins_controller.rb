class AdminsController < ApplicationController

  before_filter :signed_in_admin 

  def edit_company
    @title = "Website Setup"
    @summary = "Customize your website"
    @is_admin_page = true
  end

  def edit_home
    @title = "Home Page Setup"
    @summary = "Edit the home page to your liking"
    @is_admin_page = true
  end

  def edit_about
    @sheet = Company.first.sheets.find_by_name("about")
    @title = "About Page Setup"
    @summary = "Edit the about page to your liking"
    @is_admin_page = true
    render '/admins/edit_sheet.html.erb'
  end

  def edit_services
    @sheet = Company.first.sheets.find_by_name("services")
    @title = "Services Page Setup"
    @summary = "Edit the services page to your liking"
    @is_admin_page = true
    render '/admins/edit_sheet.html.erb'
  end

  def update_company
    company = Company.first
    company.title = params[:title]
    company.phone = params[:phone]
    company.fax   = params[:fax]
    if company.save
      redirect_to :back, notice: "Company information was successfully updated."
    else
      redirect_to :back
    end
  end

  def update_home
    company = Company.first
    company.quick_description = params[:quick_description]
    company.summary = params[:summary]
    if company.save
      redirect_to :back, notice: "Home section was successfully updated."
    else
      redirect_to :back
    end
  end

  def update_sheet
    sheet = Company.first.sheets.find_by_name(params[:name])
    errors = sheet.update_fields(params)
    if sheet.save & !errors
      redirect_to :back, notice: "#{sheet.title} section was successfully updated."
    else
      redirect_to :back
    end
  end

  def add_page
    sheet = Sheet.find(params[:sheet_id])

    page = sheet.pages.create(
      name: "new",
      title: "New",
      reversed: false,
      banner_img_url: "upload_picture.jpg")

    page.description = Description.create(
      title:      "New",
      body:       "Insert text here",
      short_body: "Insert text here")
      
    flash[:success] = "Added page to #{} Sheet!"
    redirect_to :back
  end

  def delete_page
    Page.find(params[:page_id]).destroy
    flash[:success] = "Deleted page!"
    redirect_to :back
  end

  private

    def signed_in_admin
      if !admin_signed_in?
        flash[:warning] = "Admin not signed in"
        redirect_to(root_path)
      end
    end
end
