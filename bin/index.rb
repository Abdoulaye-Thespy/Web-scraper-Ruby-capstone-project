require 'nokogiri'
require 'httparty'
require 'byebug'
require 'pry'
require_relative '../lib/logic.rb'
require_relative '../lib/scraper.rb'

obj = Scraper.new
obj.scrape
    job_obj=[]

21.times do |x|
    job_obj << {:location => obj.jobs[x].text, :job_title => obj.jobs[x].text, :salary => obj.jobs[x].text }
	puts "Job location is #{obj.location[x]}" 
end 
Pry.start(binding)