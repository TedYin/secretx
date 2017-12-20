require 'secretx/configuration'
require 'secretx/encode'
require 'secretx/rsa'
require 'secretx/mode'
require 'secretx/aes'

module SecretX
  def self.conf
    @conf ||= SecretX::Configuration.new
  end

  def self.config(&block)
    block.call(conf)
  end
end
