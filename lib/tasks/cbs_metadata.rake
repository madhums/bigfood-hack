require "json"
require "nokogiri"
require "httpx"

namespace :cbs do
  desc "Fetch and process CBS metadata"
  task fetch_metadata: :environment do
    url = "https://opendata.cbs.nl/ODataApi"

    def fetch_links(url)
      response = HTTPX.get(url)
      return [] unless response.status == 200

      doc = Nokogiri::HTML(response.body.to_s)
      links = doc.css("a").map { |a| a["href"] }.compact.uniq
      links.map { |link| URI.join(url, link).to_s }
    end

    def process_link(link)
      response = HTTPX.get(link + "/TableInfos")
      return unless response.status == 200

      content = Nokogiri::HTML(response.body.to_s).text
      parsed_content = JSON.parse(content)
      metadata = parsed_content["value"].first

      row = CbsMetadata.create!(
        title: metadata["Title"],
        short_title: metadata["ShortTitle"],
        summary: metadata["Summary"],
        language: metadata["Language"],
        period: metadata["Period"],
        description: metadata["Description"],
        identifier: metadata["Identifier"],
        raw: metadata
      )
      puts "Saved: #{row.title}"
    rescue => e
      puts "Error processing #{link}: #{e.message}"
    end

    links = fetch_links(url)
    links.each { |link| process_link(link) }
    # process_link(links[0])
  end
end
