require 'faraday'
require 'debug'

class FaradaySample
  def request
    # Create a Faraday connection object with retry middleware
    binding.break
    conn = Faraday.new(url: 'https://example.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    # Make a GET request to the /posts endpoint
    response = conn.get('/')

    # Print the response body
    puts response.body
  end
end