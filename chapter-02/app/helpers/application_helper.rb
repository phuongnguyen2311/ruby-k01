module ApplicationHelper
 def full_title page_title = ""
   base_title = "Ruby on Rails Tutorial Sample App"
   page_title.empty? ? base_title : "#{page_title} | #{base_title}"
 end
 def full_name user_name = ""
    user_name = "cong giap"
 end
end
