class Scraper
  attr_reader :parsed_page, :unparsed_page, :location, :job_title, :salary, :employer, :posted_date, :jobs, :link, :job_obj, :ul, :hash
  def initialize
    @url = 'https://www.jobcoconut.com/job-search'
    @unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
  end

  def scrape
    @jobs = parsed_page.css('div.row')
  end

  def create_hash
    @hash = []
    count = jobs.count
    count.times do |x|
      hash << { job_title: jobs[x].css('div.job-title').text.gsub("\n", ' '),
                location: jobs[x].css('li.results-job-location').text,
                salary: jobs[x].css('li.results-salary').text,
                employer: jobs[x].css('li.results-client-name').text,
                posted_date: jobs[x].css('li.results-posted-at').text.gsub("\n", ' '),
                link: jobs[x].css('a').attr('href').value }
    end
  end
end
