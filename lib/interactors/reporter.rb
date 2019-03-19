require 'csv'
require './lib/interactors/page_scraper'

class Reporter
  attr_accessor :urls, :report

  def initialize(urls:)
    @urls = urls
  end

  def call
    timestamp = Time.new.strftime("%Y-%m-%d-%H:%M:%S")
    filepath = "./lib/output/report_#{timestamp}.csv"

    CSV.open(filepath, "wb") do |csv|
      csv << ["short_url", "hits", "score_granny", "score_regular", "ttfg", "full_url"]
      urls.each do |url|
        scr = PageScraper.new(url: url)
        scr.call
        csv << [scr.short_url, scr.hits, scr.score_granny, scr.score_regular, scr.time_to_first_granny, scr.url]
      end
    end
    $stdout.flush
    puts "Generated report and saved it to #{filepath}."
  end
end
