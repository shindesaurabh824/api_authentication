module Middleware
  FILTER = ['/users']
  class Authentication
    def initialize(app)
      @app = app
    end

    def call(env)
      request = ActionDispatch::Request.new(env)
      return @app.call(env) if FILTER.include?(request.path)

      token = request.params['data']
      access_token = request.headers['HTTP_ACCESS_TOKEN']
      data = JsonWebToken.decode(token) if token
      if authenticate(request, data, access_token)
        @app.call(env)
      end
    end

    private

    def authenticate(request, data, access_token)
      if validate(access_token)
        request.params['data'] = data
      else
        raise StandardError.new "Invalid Token"
      end
      true
    end

    def validate(access_token)
      token_data = JsonWebToken.decode(access_token)
      return false unless token_data

      return User.where(id: token_data['id'], email: token_data['email']).present?
    end
  end
end
