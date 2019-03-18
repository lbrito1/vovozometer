require 'selenium-webdriver'
require 'webdriver-user-agent'

class PageScraper
  attr_accessor :score_granny, :score_regular, :time_to_first_granny, :url, :occurrences

  def initialize(url:)
    @score_granny = 0
    @score_regular = 0
    @url = url
    @terms = YAML.load(File.read('./lib/input/terms.yml'))
    @occurrences = []
    @time_to_first_granny = nil
  end

  def call
    repeat = 10

    @results ||= begin
      repeat.times do |i|
        print "Scraping #{url}. Done #{i + 1} of #{repeat} times...\r"
        $stdout.flush
        text = get_page_content
        calculate_scores(i, text)
      end
    end

    driver.quit
  end

  private

  def get_page_content
    driver.get(url)

    # Important: go to end of page
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")

    sleep 1 # wait for js load / avoid throttling

    body = driver.find_element(css: 'body')
    body.attribute("innerHTML").downcase
  end

  def calculate_scores(iteration, text)
    @terms.keys.each do |group|
      @terms[group].each do |term|
        if text.include?(term)
          occurrences << term
          if group == 'granny'
            @time_to_first_granny ||= iteration
            @score_granny += 1
          end
          @score_regular += 1 if group == 'regular'
        end
      end
    end
  end

  def driver
    @driver ||= Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone)
  end
end
