require_relative '../lib/scraper.rb'
require_relative '../lib/logic.rb'
require_relative '../lib/methods.rb'
require 'csv'
require 'nokogiri'
require 'httparty'
require 'byebug'
require 'pry'
include Methods
describe '.Scraper' do
  let(:ob) { Scraper.new }
  context '#scrape' do
    it 'checks that scrape function do not return nul' do
      expect(ob.scrape).not_to be(nil)
    end
  end

  context '#scrape ' do
    it 'makes sure scrape method  do not return nil' do
      expect(ob.scrape).not_to be(nil)
    end
  end

  context '#scrape makes sure scrape method  do not return nil' do
    it 'Makes sure that we are getting 21 jobs of that page' do
      expect(ob.scrape).not_to be(nil)
      expect(ob.create_hash).to be(21)
    end
  end
end

describe '.Logic' do
  let(:ob1) { Logic.new(5) }
  let(:title) {ob1.get_job_title(2)}
  let(:location) {ob1.get_location(2)}
  let(:salary) {ob1.get_salary(2)}
  let(:employer) {ob1.get_employer(2)}
  let(:date) {ob1.get_posted_date(2)}
  let(:link) {ob1.get_links(2)}
  context '#scrape' do
    it 'checks that Job_title is returned' do
      expect(title).to be_a(String)
    end
  end

  context '#scrape' do
    it 'checks that Job_title is returned' do
      expect(location).to be_a(String)
    end
  end

  context '#scrape' do
    it 'checks that Job_title is returned' do
      expect(salary).to be_a(String)
    end
  end

  context '#scrape' do
    it 'checks that Job_title is returned' do
      expect(employer).to be_a(String)
    end
  end
  context '#scrape' do
    it 'checks that Job_title is returned' do
      expect(date).to be_a(String)
    end
  end
  context '#scrape' do
    it 'checks that Job_title is returned' do
      expect(link).to be_a(String)
    end
  end
end

describe '.Methods' do
	chec = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    it 'checks whether the page is already scraped or not' do
      expect(check?(chec, 4)).to be(false)
    end

      it 'checks whether the page is already scraped or not' do
      expect(check?(chec, 5)).to be(true)
    end
end