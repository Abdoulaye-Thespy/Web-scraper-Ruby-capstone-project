
class Scraper
  attr_reader :parsed_page, :unparsed_page, :location, :job_title, :salary, :employer, :posted_date, :jobs, :link, :job_obj, :ul
  def initialize
    @url = 'https://www.jobcoconut.com/job-search'
    @unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
  end

  def scrape
    @jobs = parsed_page.css('div.row')
    @job_title =jobs.css('div.job-title').children.map { |x| x.text}.select! {|x| x!="\n"&& x!="\n\n"}
    @ul=jobs.css('ul.job-info')
    @location = jobs.css('li.results-job-location').children.map(&:text)
    @salary = jobs.css('li.results-salary').children.map do |x| 
    end
    @employer = jobs.css('li.results-client-name').children.map { |x| x.text}
    @posted_date = jobs.css('li.results-posted-at').children.map { |x| x.text.gsub("\n"," ")}
    @link = jobs.css('a').attr('href').value
  end
end