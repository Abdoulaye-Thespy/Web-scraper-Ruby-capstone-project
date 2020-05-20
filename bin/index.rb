#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/scraper.rb'
require_relative '../lib/logic'
require 'nokogiri'
require 'httparty'
require 'byebug'
require 'pry'

    obj = Scraper.new
    obj.scrape
    obj.create_hash
    puts
    puts
    puts

    puts ".............................Jobs got from page 1............................................"
    job_obj = obj.hash
    p job_obj
loop do
  puts
  puts
  puts
  puts '................................choose page number, enter a number from 1 to 21.............................'
  Page_num = gets.chomp.to_i
  if Page_num > 1 && Page_num < 22
    objf = Logic.new(Page_num)
    20.times do |x|
      puts 'Razak'
      job_obj << { job_title: objf.get_job_title(x),
                   location: objf.get_location(x),
                   salary: objf.get_salary(x),
                   employer: objf.get_employer(x),
                   posted_date: objf.get_posted_date(x),
                   link: objf.get_links(x) }
    end
    puts
    puts
    puts

    puts ".............................Jobs got from page #{Page_num}............................................"


  else puts '........................wrong number please enter a number from 1 to 21...................................'
    end
  puts job_obj
  puts obj.hash
  Pry.start(binding)
end

# CSV.open("jobs.csv", "wb") do |csv|
#   obj.hash.each do |item|
#    csv << [:, link]
#   end
# end
# Pry.start(binding)
