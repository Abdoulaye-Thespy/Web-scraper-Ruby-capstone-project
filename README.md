# Web-scraper-Ruby-capstone-project

# What's a Web scraper

## A web scraper is a small progamm used to access a specific website and try to retrieve datas from it

## website: https://www.jobcoconut.com/job-search is where we will be trying to get our informations from, these information will be as follows: 

# job's title

# job's location

# Expected salary

# Name of the employer

# posted date

# links which are the direct link to those particular jobs.


## Built With

- Ruby

- Nokogiri gem

- Httparty gem

- Pry gem

- and byebug to help with debugging

To get a local copy up and running follow these simple example steps.

### Prerequisites

Clone this project running the following command in your terminal: git clone https://github.com/Abdoulaye-Thespy/Web-scraper-Ruby-capstone-project.git

 *gem install pry* to install pry

 *gem install nokogiri* to install Nokogiri

 *gem install byebug* to install byebug

 *gem install httparty* to install httparty

### Setup

Navigate to the folder where the project has been cloned

### Install

Install the The Gems files by running `bundle install`

# Descritption

- This is a web Scraper, that means, we will access a specific website and try to retrieve datas from it using this program.

- To Run This program you need to open your teminal and run: index (executable file)

- The scraper will derectly access the webpage for you and will return the datas from the first page.

- In this case, the website we will be scraping is a job listing website: https://www.jobcoconut.com/job-search



### Usage

1. Just run `index.rb or bin/index.rb` in your terminal to start the scraper
2. When prompted, You will have the jobs of the first page displayed
3. When prompted, enter the number of the next page you would like to add.
4. A hash will be shown on the screen after each page
5. Enter the amount of pages you want
6. Ignore the two lines promted by the shel telling you that ou have jobs listing from another page.
7. when you feel like quiting and when you press 0, the program will create a CSV file called jobs.csv and store our jobs along with all the informations inside of it


## Author

👤 **Njgouh Abdoulaye Razak**

- Github: [@AbdoulayeRazak](https://github.com/Abdoulaye-Thespy)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Abdoulaye-Thespy/Web-scraper-Ruby-capstone-project/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.