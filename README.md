# SecretX

Encrypt and decrypt all in one .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'secretx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install secretx

## Usage

### Configuration 
> config/initializers/setup_secretx.rb

```ruby
SecretX.config do |conf|
  # AES config
  
  # default aes_key is d87bdfe63b7dda1452f3361b57b560c52e1a2aaffdcb31ae38f44a06efc536d4
  # conf.aes_key = 'Your aes cbc mode secret key .'
  
  # default aes_iv is nil
  # conf.aes_iv = 'Your aes cbc mode iv .'
  
  # default aes mode is AES-256-CBC
  # conf.aes_mode = Mode::AES_256_CBC # or AES_128_CBC
  
  # Default encode is Base64, If encode_mode is nil ,it will not encode or decode msg.
  # If encode_mode is present, the encrypt result will be encode, and the encrypted data will be decode first, and then it will be decrypted.
  # conf.encode_mode = Mode::BASE_64
  
  # RSA config
  conf.rsa_pub_key_path = 'Your rsa public pem file path'
  conf.rsa_pri_key_path = 'Your rsa private pem file path'
  conf.rsa_pwd = 'Your rsa private pem password'
  
  # Default hash config is SHA256, if hash_mode set nil, RSA will cant use. 
  # conf.hash_mode = Mode::SHA_256 # or MD5
end
```

### AES CBC Mode
```ruby
SecretX::AES.encrypt msg
SecretX::AES.decrypt cipher
```

### RSA
```ruby
SecretX::RSA.encrypt msg
SecretX::RSA.decrypt cipher
SecretX::RSA.sign msg
SecretX::RSA.verify_sign signature, origin
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TedYin/secret. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
