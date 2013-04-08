include ApplicationHelper

$company_save
def company
  if defined? $company_save
    $company_save
  else
    $company_save = Company.create(title: "Test Company", logo_url: "/images/americo_logo.jpg")
    $company_save.description = Description.create(title: "Test Title", body: "Test Body")
    $company_save.save
    $company_save
  end
end

def full_title(page_title)
  base_title = company.title
  base_title = "#{base_title} | #{page_title}" if !page_title.empty?
  base_title
end
