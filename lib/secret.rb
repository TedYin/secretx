require 'secret/mode'
require 'secret/configuration'

module Secret
  def self.conf
    @conf ||= Secret::Configuration.new
  end

  def self.config(&block)
    block.call(conf)
  end
end
