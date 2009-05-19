module NetFlix

  class << self
	  
    def credentials
      @credentials ||= NetFlix::Credentials.from_file 
    end
  
    def logger
      @logger ||= RAILS_DEFAULT_LOGGER 
    end

    def log(message)
      puts "[#{Time.now.to_i}] #{message}"
    end  
  end # class methods
end
