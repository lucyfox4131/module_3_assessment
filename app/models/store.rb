class Store

  def initialize(store)
    @name = store["longName"]
    @type = store["storeType"]
    @street_address = store["address"]
    @city = store["city"]
    @state = store["region"]
    @zip = store["postalCode"]
    @hours = format_hours(store["hoursAmPm"])
  end

  def self.single_store(id)
    create_new(StoreService.new.single_store(id))
  end

  def self.create_new(store)
    new(results["stores"].first)
  end

  def format_hours
    # "Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm"
  end
end
