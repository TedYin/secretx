require 'secret'
module Secret
  class Configuration
    attr_accessor :aes_mode, :aes_key, :aes_iv, :rsa_pub_key_path,
                  :rsa_pri_key_path, :rsa_pwd, :hash_mode,
                  :encode_mode

    def initialize
      self.aes_key = 'd87bdfe63b7dda1452f3361b57b560c52e1a2aaffdcb31ae38f44a06efc536d4'
      self.aes_iv = nil
      self.aes_mode = Mode::AES_256_CBC
      self.hash_mode = Mode::SHA_256
      self.encode_mode = Mode::BASE_64
    end
  end
end
