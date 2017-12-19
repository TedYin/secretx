# Secret

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/secret`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'secret'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install secret

## Usage

### Configuration 
> config/initializers/setup_secret.rb

```ruby
Secret.config do |conf|
  conf.aes_key = 'Your aes cbc mode secret key .'
  conf.aes_iv = 'Your aes cbc mode iv .'
  conf.aes_mode = Mode::AES_256_CBC # or AES_128_CBC
  conf.hash_mode = Mode::SHA_256 # or MD5
  # If encode_mode is nil ,it will not encode or decode msg
  conf.encode_mode = Mode::BASE_64
  # RSA pem file config
  conf.rsa_pub_key_path = 'Your rsa public pem file path'
  conf.rsa_pri_key_path = 'Your rsa private pem file path'
  conf.rsa_pwd = 'Your rsa private pem password'
end
```

### AES CBC Mode
```ruby
Secret::AES.encrypt msg
Secret::AES.decrypt cipher
```

### RSA
```ruby
Secret::RSA.encrypt msg
Secret::RSA.decrypt cipher
Secret::RSA.sign msg
Secret::RSA.verify_sign signature, origin
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TedYin/secret. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Secret project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/secret/blob/master/CODE_OF_CONDUCT.md).
