module ApplicationHelper
  def html_title(page_title = '')
    base_title = "Code Quiz"
    if page_title.nil?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
