require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://www.college.columbia.edu/bulletin/depts/mealac.php"
BASE_URL = "http://www.college.columbia.edu/"
page = Nokogiri::HTML(open(PAGE_URL))

#puts page.css("title")[0].name
#puts page.css("title")[0].text

links = page.css("#Departments_of_Instruction").css("a")

links[2..-2].each do |link|
	href = link["href"]
	remote_url = BASE_URL + href + "?tab=courses"
	#puts remote_url
	page2 = Nokogiri::HTML(open(remote_url))
	courses = page2.css(".course-description p strong")
=begin
	courses.each{|title| puts "#{title.text}"}
=end
	#puts link.text
end
