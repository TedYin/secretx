require 'secretx/encode'
require 'openssl'
require 'secretx/mode'

module SecretX
  class AES
    include SecretX::Encode

    def initialize(mode = Mode::AES_256_CBC)
      @cipher = OpenSSL::Cipher::Cipher.new mode
    end

    def self.mode(mode = Mode::AES_256_CBC)
      self.new(mode)
    end

    def self.encrypt(msg)
      self.mode.encrypt msg
    end

    def self.decrypt(msg)
      self.mode.decrypt msg
    end

    def encrypt(msg, key = SecretX.conf.aes_key, iv = SecretX.conf.aes_iv)
      @cipher.encrypt
      @cipher.key = digest_key(key)
      @cipher.iv = iv if iv != nil
      encode_if_need(@cipher.update(msg) + @cipher.final)
    end

    def decrypt(msg, key = SecretX.conf.aes_key, iv = SecretX.conf.aes_iv)
      @cipher.decrypt
      @cipher.key = digest_key(key)
      @cipher.iv = iv if iv != nil
      @cipher.update(decode_if_need(msg)) + @cipher.final
    end

    private

    def digest_key(key)
      hash_mode = SecretX.conf.hash_mode
      if hash_mode
        hash_mode.hexdigest key
      else
        key
      end
    end
  end
end