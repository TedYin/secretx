require 'test_helper'
require 'secretx/aes'

class SecretX::AESTest < Minitest::Test
  def test_aes_cbc
    msg = 'super hero'
    cipher = SecretX::AES.mode(SecretX::Mode::AES_256_CBC)
    signed = cipher.encrypt msg
    assert signed
    origin = cipher.decrypt signed
    assert_equal msg, origin
  end
end
