module ApplicationHelper

  def company
    build_stubs unless Company.exists?
    @company ||= Company.first
  end

  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = company.title
    base_title = "#{page_title} | #{base_title}" if !page_title.empty?
    base_title
  end

  private

    def build_stubs
      new_company
      new_services_sheet
      new_about_sheet
      add_stub_admin
    end

    def new_company
      @company = Company.create(
           title: "Company Name",
           phone: "(555) 555-5555",
             fax: "(555) 555-5555",
        subtitle: "Quick description or quote",
         summary: "Paragraphs describing the company.",
           email: "example@company.com",
         address: "555 Somewhere Lane",
            city: "Someplace",
           state: "CO",
         zipcode: "55555"
      )
    end

    def new_services_sheet
      new_sheet "services", "Services"
    end

    def new_about_sheet
      new_sheet "about", "About"
    end

    def new_sheet(name, title)
      sheet = company.sheets.create(
        name: name,
        title: title,
        subtitle: 
          "Provide a very high level sentence describing the work done here."
      )

      sheet.pages.create(
        name: "sample",
        title: "Sample Page",
        short_description: 
          "This is a short one or two sentence description for the page.",
        description: "A few paragraphs describing this page.",
        row: 1,
        reversed: false
      )
    end

    def add_stub_admin
      admin = Admin.new(
        email: "admin@email.com",
        password: "administrator",
        password_confirmation: "administrator"
      )
      admin.save
    end
end
