module SecretX
  class RSA
    include SecretX::Encode 
    def initialize
      init_private_key
      init_public_key
    end
    
    def self.rsa
      @rsa ||= self.new
    end

    def self.encrypt(msg)
      rsa.encrypt msg
    end

    def self.decrypt(msg)
      rsa.decrypt msg
    end

    def self.sign(msg)
      rsa.sign msg
    end

    def self.verify_sign(signed_msg, origin_msg)
      rsa.verify_sign signed_msg, origin_msg
    end

    def encrypt(msg)
      encode_if_need pub_k.public_encrypt(msg)
    end

    def decrypt(msg)
      pri_k.private_decrypt decode_if_need(msg)
    end

    def sign(msg)
      encode_if_need pri_k.sign(SecretX.conf.hash_mode, msg)
    end

    def verify_sign(signed_msg, origin_msg)
      pub_k.verify SecretX.conf.hash_mode, decode_if_need(signed_msg), origin_msg
    end

    private

    def init_private_key(path = SecretX.conf.rsa_pri_key_path, pwd = SecretX.conf.rsa_pwd)
      raise 'Private pem path can not be nil !' if path.to_s == ''
      @private_key ||= OpenSSL::PKey::RSA.new(File.read(path), pwd)
    end

    def init_public_key(path = SecretX.conf.rsa_pub_key_path)
      raise 'Public pem path can not be nil !' if path.to_s == ''
      @public_key ||= OpenSSL::PKey::RSA.new(File.read(path))
    end

    def pri_k
      @private_key
    end

    def pub_k
      @public_key
    end
  end
end