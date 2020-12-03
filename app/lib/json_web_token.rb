class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, $secret[:devise_jwt_secret_key], 'HS256')
    end

    def decode(token)
      body = JWT.decode(token, $secret[:devise_jwt_secret_key], true, { algorithm: 'HS256' })[0]
      HashWithIndifferentAccess.new(body)
    rescue
      nil
    end
  end
end
