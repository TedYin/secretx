require 'test_helper'
require 'secret/aes'
require 'secret/mode'

class SecretTest < Minitest::Test
  def test_aes_cbc
    msg = 'super hero'
    cipher = Secret::AES.mode(Secret::Mode::AES_256_CBC)
    signed = cipher.encrypt msg
    assert signed
    origin = cipher.decrypt signed
    assert_equal msg, origin
  end
end
