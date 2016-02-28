# imgur image downloader, requires nokogiri and httparty

require 'nokogiri'
require 'open-uri'
require 'httparty'

link = ARGV[0]
page = Nokogiri::HTML(open(link))

# Test link for nil
unless link.nil? puts "There was no proper link passed to the script"; exit end

# Collect the links int image_links[]
image_tags = page.css('meta')
image_links = []

image_tags.each do |tag|
  link = tag['content']
  image_links << link.chomp unless link[0..5] != "http:/"
end

# cleanup
image_links.delete_at(0)

begin
  counter = 0
  image_links.each do |image_link|
    File.open("#{counter}.jpg", "w") do |file|
      file.binmode
      file.write HTTParty.get(image_link).parsed_response
      counter += 1
    end
  end
rescue e => Exception
  puts "There was a problem scraping the images"
  exit()
end
