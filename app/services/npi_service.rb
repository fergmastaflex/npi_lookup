class NpiService
  BASE_URI = 'https://npiregistry.cms.hhs.gov/api/?version=2.0'.freeze

  def initialize(number)
    @number = number
  end

  def lookup
    # Host must be specified in order to force ipv4
    # The NPPES API does not do ipv6
    response = HTTParty.get(request_uri, local_host: ip_address)
    parse_provider(response['results'].first)
  end

  private

  attr_reader :number

  def ip_address
    Socket.ip_address_list.select(&:ipv4?).detect{|addr| addr.ip_address != '127.0.0.1'}.ip_address
  end

  def parse_provider(response)
    {
      npi: response['number'],
      name: response['basic']['name'],
      addresses: response['addresses'],
      taxonomies: response['taxonomies']
    }
  end

  def request_uri
    BASE_URI + "&number=#{number}"
  end
end
