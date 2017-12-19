require 'test_helper'

class SecretTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Secret::VERSION
  end
end
