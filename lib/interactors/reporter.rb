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
      csv << ["short-url", "hits", "score-granny", "score-regular", "ttfg", "gtr-ratio", "full-url"]
      urls.each do |url|
        scr = PageScraper.new(url: url)
        scr.call

        granny_to_regular_ratio = if score_regular > 0
          score_granny / score_regular.to_f
        else
          0
        end

        csv << [scr.short_url,
          scr.hits,
          scr.score_granny,
          scr.score_regular,
          scr.time_to_first_granny,
          granny_to_regular_ratio,
          scr.url]
      end
    end
    $stdout.flush
    puts "Generated report and saved it to #{filepath}."
  end
end
