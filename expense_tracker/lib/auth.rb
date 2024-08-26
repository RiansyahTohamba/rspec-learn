module Middleware
  class Auth
    def initialize(app)
      @app = app
    end

    def call(env)
      request = ActionDispatch::Request.new(env)
      if request.headers['token'] != 'my-secret-token'
        return [200, {}, ['invalid or missing token']]
      end
  
      @app.call(env)
    end
  end
end