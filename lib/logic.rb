require_relative './logic'
class Logic < Scraper
  attr_reader :newurl, :jobst
  def initialize(num)
    @newurl = "https://www.jobcoconut.com/job-search/page/#{num}"
    @unparsed_page = HTTParty.get(newurl)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @jobst = parsed_page.css('div.row')
  end

  def get_job_title(num)
    @job_title = jobst[num].css('div.job-title').text.gsub("\n", ' ')
  end

  def get_location(num)
    jobst[num].css('li.results-job-location').text
  end

  def get_salary(num)
    jobst[num].css('li.results-salary').text
  end

  def get_employer(num)
    jobst[num].css('li.results-client-name').text
  end

  def get_posted_date(num)
    jobst[num].css('li.results-posted-at').text.gsub("\n", ' ')
  end

  def get_links(num)
    jobst[num].css('a').attr('href').value
  end
end
