require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      binding.pry
      @all = []
      @all = doc.css("post")
      @course_info = [{"title": "", "schedule":"", "description": ""}]
      @all.each do |entry|
        @course_info["title"] << entry.css("h2").text
        @course_info["schedules"] << entry.css(".date").text
        @course_info["descriptions"] << entry.css("p").text
      end
      @course_info.each do |
    end
    
    def get_courses
    end
    
    def make_courses
    end
    
    def print_courses
      self.make_courses
      Course.all.each do |course|
        if course.title
          puts "Title: #{course.title}"
          puts "  Schedule: #{course.schedule}"
          puts "  Description: #{course.description}"
        end
      end
    end

end

Scraper.new.get_page


