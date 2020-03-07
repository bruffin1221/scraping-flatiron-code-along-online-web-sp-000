require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
      binding.pry
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end


end

Scraper.new.get_page

#require 'nokogiri'
#require 'open-uri'
#html=open("https://learn-co-curriculum.github.io/student-scraper-test-page/")
#doc=Nokogiri::HTML(html=open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

#students=doc.css(".student-card")

#students.each do |student|
#  puts student.css(".student-name").text
#  puts student.css(".student-location").text
#  binding.pry
#end

#  profile_url=puts student.css("a")[1].attribute("href").value
#end
# puts student.css(".student-location")

  #doc.css(".post").each do |post|
        #course = Course.new
        #course.title = post.css("h2").text
        #course.schedule = post.css(".date").text
        #course.description = post.css("p").text
      #end
#puts doc.css(".student-card").attribute("")
#.attribute
#puts doc.css("h4")
#puts doc.css(".student-name").text.strip
#puts doc.css(".student-location")
#puts doc.css("h3")
#puts doc.css(".student")
#p doc.css("p").text
#doc.css("student-class")

#a href="students/kris-henderson.html"
#doc.css("a")[1].attribute("href").value
#.value
