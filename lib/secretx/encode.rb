module SecretX
  module Encode
    def encode_if_need(msg)
      if base64?
        @mode.encode64 msg
      else
        msg
      end
    end

    def decode_if_need(msg)
      if base64?
        @mode.decode64 msg
      else
        msg
      end
    end

    private

    def base64?
      @mode = SecretX.conf.encode_mode
      if @mode&.name == 'Base64'
        true
      else
        false
      end
    end
  end
end