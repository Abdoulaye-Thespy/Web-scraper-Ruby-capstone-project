#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'
require_relative '../lib/logic.rb'
require_relative '../lib/methods.rb'
require 'csv'
require 'nokogiri'
require 'httparty'
require 'byebug'
require 'pry'
include Methods
chec = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
obj = Scraper.new
array = []
obj.scrape
obj.create_hash
puts
puts
puts

puts '.............................Jobs got from page 1............................................'
job_obj = obj.hash
job_obj.each do |key, value|
  puts "#{key} is #{value}"
  puts
end

loop do
  puts
  puts
  puts
  puts '................................choose page number, enter a number from 1 to 21.............................'
  Page_num = gets.chomp.to_i
  res = Methods.check(chec, Page_num)
  if Page_num > 1 && Page_num < 22 && res
    objf = Logic.new(Page_num)
    20.times do |x|
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

    puts '.............................Jobs got from selected pages............................................'
    job_obj.each do |key, value|
      puts "#{key} is #{value}"
      puts
    end
    puts
    puts
    puts
  else puts '........................wrong number please enter a number from 1 to 21...................................'
  end
  puts
  puts
  puts
  puts 'Enter 0 to exit or enter any other key to countinue'
  choice = gets.chomp.to_i

  next unless choice == 0

  headers = %w[Job_title Location Salary Employer posted_date link]
  csv = CSV.open('jobs.csv', 'a+') do |row|
    row << headers
  end
  job_obj.count.times do |key, _value|
    array << job_obj[key]
    csv = CSV.open('jobs.csv', 'a+') do |row|
      row << array
    end
  end
  break
end
