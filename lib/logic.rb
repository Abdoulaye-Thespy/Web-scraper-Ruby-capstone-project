# frozen_string_literal: true

require_relative './logic'
class Logic < Scraper
  attr_reader :newurl, :jobst
  def initialize(x)
    @newurl = "https://www.jobcoconut.com/job-search/page/#{x}"
    @unparsed_page = HTTParty.get(newurl)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @jobst = parsed_page.css('div.row')
  end

  def get_job_title(x)
    @job_title = jobst[x].css('div.job-title').text.gsub("\n", ' ')
  end

  def get_location(x)
    jobst[x].css('li.results-job-location').text
  end

  def get_salary(x)
    jobst[x].css('li.results-salary').text
  end

  def get_employer(x)
    jobst[x].css('li.results-client-name').text
  end

  def get_posted_date(x)
    jobst[x].css('li.results-posted-at').text.gsub("\n", ' ')
  end

  def get_links(x)
    jobst[x].css('a').attr('href').value
  end
end
