require "json"
require "nokogiri"
require "httpx"

namespace :cbs do
  desc "Fetch and process CBS metadata columns"
  task fetch_metafields: :environment do
    def process_link(metadata)
      url = "https://opendata.cbs.nl/ODataApi/OData/"
      response = HTTPX.get(url + metadata.identifier + "/DataProperties")
      return unless response.status == 200

      content = Nokogiri::HTML(response.body.to_s).text
      parsed_content = JSON.parse(content)
      fields = parsed_content["value"]

      fields.each do |field|
        row = CbsMetafield.create!(
          title: field["Title"],
          key: field["Key"],
          description: field["Description"],
          raw: field,
          cbs_metadata_id: metadata.id
        )
        puts "Saved: #{row.title}"
      end
    rescue => e
      puts "Error processing #{link}: #{e.message}"
    end

    CbsMetadata.find_each do |metadata|
      process_link(metadata)
    end
    # process_link(CbsMetadata.first)
  end
end
