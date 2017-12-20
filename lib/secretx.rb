require 'secretx/configuration'

module SecretX
  def self.conf
    @conf ||= SecretX::Configuration.new
  end

  def self.config(&block)
    block.call(conf)
  end
  
  def self.rsa
    
  end
end
