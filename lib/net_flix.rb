module NetFlix

  class << self
	  
    def credentials
      @credentials ||= NetFlix::Credentials.from_file 
    end
  
    def logger
      @logger ||= RAILS_DEFAULT_LOGGER 
    end

    def log(message)
      logger.debug "[#{Time.now.to_i}] #{message}"
    end  
  end # class methods
end
