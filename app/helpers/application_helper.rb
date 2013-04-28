module ApplicationHelper

  def company
    Company.first
  end

  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = company.title
    base_title = "#{page_title} | #{base_title}" if !page_title.empty?
    base_title
  end
end
