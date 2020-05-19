# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'pry'

class Scraper
  attr_reader :parsed_page, :unparsed_page, :location
  def initialize
    @url = 'https://www.jobcoconut.com/job-search'
    @unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
  end

  def scrape
    jobs = parsed_page.css('div.row')
    @location = jobs.css('li.results-job-location').children.map(&:text).compact
  end
end

obj = Scraper.new
obj.scrape
Pry.start(binding)
