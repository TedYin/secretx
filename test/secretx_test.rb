require 'test_helper'
require 'secretx/version'

class SecretXTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SecretX::VERSION
  end
end
