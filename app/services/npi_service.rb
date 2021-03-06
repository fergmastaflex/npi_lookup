class NpiService
  BASE_URI = 'https://npiregistry.cms.hhs.gov/api/?version=2.0'.freeze

  def self.get_provider(number)
    self.new(number).get_provider
  end

  def initialize(number)
    @number = number
  end

  def get_provider
    # Host must be specified in order to force ipv4
    # The NPPES API does not do ipv6
    response = HTTParty.get(request_uri, local_host: ip_address)
    raise ErrorHandler::NpiError if response['Errors'].present?
    parse_provider(response['results'].first).deep_symbolize_keys
  end

  private

  attr_reader :number

  def ip_address
    Socket.ip_address_list.select(&:ipv4?).detect{ |addr| addr.ip_address != '127.0.0.1' }.ip_address
  end

  def parse_provider(response)
    {
      npi: response['number'],
      name: response['basic']['name'],
      addresses_attributes: response['addresses'],
      taxonomies_attributes: response['taxonomies']
    }
  end

  def request_uri
    BASE_URI + "&number=#{number}"
  end
end
