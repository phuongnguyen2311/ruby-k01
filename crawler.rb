require 'open-uri'
require 'nokogiri'

cities       = ['sanfrancisco', 'seattle']
search_terms = ['ruby', 'python', 'react', 'java']

cities.each do |city|
    search_terms.each do |search_term|

url = "https://#{city}.craigslist.org/search/cpg?query=#{search_term}&is_paid=all"
puts '======================================================='
puts '======================================================='
puts '======================================================='
puts city
puts search_term
puts '======================================================='
puts '======================================================='
puts '======================================================='

document = open(url)
content = document.read
page = Nokogiri::HTML(content)

        page.css('.content').css('.result-row').each do |row|
            title        = row.css('.hdrlnk').first.inner_text
            link         = row.css('.hdrlnk').first.attributes["href"].value
            posted_at    = row.css('time').first.attributes["datetime"].value
            hood_elem    = row.css('.result-hood').inner_text
        

            puts "#{title} #{hood_elem}"
            puts "link: #{link}"
            puts "Posted at #{posted_at}"
            puts '======================================================='
        end
    end
end