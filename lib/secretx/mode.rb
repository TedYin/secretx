require 'openssl'
require 'base64'

module SecretX
  module Mode
    AES_256_CBC = 'AES-256-CBC'.freeze
    AES_128_CBC = 'AES-128-CBC'.freeze
    MD5 = OpenSSL::Digest::MD5.new.freeze
    SHA_256 = ::OpenSSL::Digest::SHA256.new.freeze
    BASE_64 = ::Base64
  end
end