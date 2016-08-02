class Store
  attr_reader :name, :type, :hours, :street_address, :city, :state, :zip

  def initialize(store)
    @name           = store["longName"]
    @type           = store["storeType"]
    @street_address = store["address"]
    @city           = store["city"]
    @state          = store["region"]
    @zip            = store["postalCode"]
    @hours          = format_hours(store["hoursAmPm"])
  end

  def self.service
    StoreService.new
  end

  def self.single_store(id)
    create_new(service.single_store(id))
  end

  def self.create_new(results)
    new(results["stores"].first)
  end

  def format_hours(hours_string)
    hours_string.split("; ")
  end

  def address
    "#{street_address} #{city}, #{state}, #{zip}"
  end
end
