module ApplicationHelper

  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = "AmeriCo Inc"
    base_title = "#{base_title} | #{page_title}" if !page_title.empty?
    base_title
  end
end
