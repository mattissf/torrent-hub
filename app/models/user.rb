class User < ActiveRecord::Base
  @@realm = 'realm'
  
  def password=(cleartext_password)
    write_attribute(
      :password,
      User.cleartext_to_digest(username, cleartext_password)
    )    
  end
  
  def self.cleartext_to_digest(username, cleartext_password)
    logger.info "Creating HA1 from #{username} and #{cleartext_password}"
    
    Digest::MD5.hexdigest([username, @@realm, cleartext_password].join(':'))  
  end
end