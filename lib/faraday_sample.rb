require 'faraday'
require 'faraday/retry'
require 'debug'

class FaradaySample
  def request
    # Create a Faraday connection object with retry middleware
    conn = Faraday.new(url: 'https://example.com') do |faraday|
      faraday.request :retry, {
        max: 3,
        interval: 0.5,
        backoff_factor: 2,
        # exceptions: [Faraday::TimeoutError]
        # exceptions: [Faraday::RetriableResponse]
        retry_statuses: [500]

      }
      faraday.adapter Faraday.default_adapter
    end

    # Make a GET request to the /posts endpoint
    
    response = conn.get('/')
    binding.break

    # Print the response body
    puts response.body
  end
end