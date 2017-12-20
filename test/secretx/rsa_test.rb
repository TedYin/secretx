require 'test_helper'
require 'secretx/rsa'

class SecretX::RSATest < Minitest::Test
  def init_secret_conf 
    SecretX.config do |conf|
      conf.rsa_pri_key_path = 'private.pem'
      conf.rsa_pub_key_path = 'public.pem'
      conf.rsa_pwd = 'password'
    end
  end

  def test_rsa_encrypt_decrypt
    init_secret_conf
    msg = 'super hero'
    cipher = SecretX::RSA.rsa
    signed = cipher.encrypt msg
    assert signed
    origin = cipher.decrypt signed
    assert_equal msg, origin
  end
  
  def test_rsa_sign_verify
    init_secret_conf
    msg = 'super hero'
    cipher = SecretX::RSA.rsa
    signed = cipher.sign(msg)
    assert signed
    assert cipher.verify_sign(signed, msg)
  end
end
