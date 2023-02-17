class LsmQueryJob < ApplicationJob
  queue_as :default

  def perform(*args)
    details = {}
    url = 'https://www.livingstream.com/en'
    query_data = {s: '978-0-7363-0373', resultsPerPage: 10}

    conn = Faraday.new(url, headers: {'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8', 'Accept': 'application/json, text/javascript, */*; q=0.01' }) do |f|
      f.response :json # decode response bodies as JSON
    end

    # encode the data as "x-www-form-urlencoded"
    encoded_data = URI.encode_www_form(query_data)
    response = conn.post('search', encoded_data)

    if response.body.class == Hash && response.body['products'].class == Array && response.body['products'].count == 1
      product = response.body['products'].first
      details[:url] = product["url"]
      details[:regular_price_amount] = product["regular_price_amount"]
      details[:reference] = product["reference"]
      details[:name] = product["name"]
      details[:category] = product["category_name"]
      
      response = Faraday.get(details[:url])
      doc = Nokogiri::HTML(response.body)

      detail_data = JSON.parse(doc.css('div#product-details').first['data-product'])
      detail_data['features'].each do |feature|
        if feature['name'] == 'Catalog'
          details[:reference] = feature["value"]
        elsif feature['name'] == 'ISBN'
          details[:sku] = feature["value"]
        elsif feature['name'] == 'Published by'
          details[:published_by] = feature["value"]
        elsif feature['name'] == 'Language'
          details[:language] = feature["value"]
        elsif feature['name'] == 'Pages'
          details[:pages] = feature["value"]
        elsif feature['name'] == 'Author'
          details[:author] = feature["value"]
        end
      end
      
      details
    end
  end
end
