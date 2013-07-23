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
    company.email = params[:email]
    company.logo = params[:logo] 

    if company.save
      redirect_to :back, notice: "Company information was successfully updated."
    else
      redirect_to :back
    end
  end

  def update_home
    company = Company.first
    company.subtitle = params[:subtitle]
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
      name: "sample",
      title: "Sample Title",
      bullet_1: "Sample Bullet 1",
      bullet_2: "Sample Bullet 2",
      bullet_3: "Sample Bullet 3",
      subtitle: "Sample Subtitle",
      short_description: "Insert a short description here...",
      description: "Add paragraphs describing the page.",
      reversed: false)
    page.name = "sample#{page.id}"
    page.save
    redirect_to :back, notice: "Added new page to sheet!"
  end

  def delete_page
    page = Page.find(params[:page_id])
    title = page.title
    page.destroy
    redirect_to :back, notice: "Deleted #{title} page!"
  end

  def delete_picture
    Picture.find(params[:picture_id]).destroy
    redirect_to :back, notice: "Deleted picture!"
  end

  private

    def signed_in_admin
      if !admin_signed_in?
        flash[:warning] = "Admin not signed in"
        redirect_to(root_path)
      end
    end
end
