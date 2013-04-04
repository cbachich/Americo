include ApplicationHelper

def company
  company ||=
    Company.create(title: "Test Company", logo_url: "http://s20.postimg.org/aqwv76rjh/americo_logo.jpg")
end

def full_title(page_title)
  base_title = company.title
  base_title = "#{base_title} | #{page_title}" if !page_title.empty?
  base_title
end
