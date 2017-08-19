module CodeClimate
  # :nodoc:
  class Middleware < Faraday::Middleware
    def call(request_env)
      headers = {}
      headers['Content-Type'] = 'application/vnd.api+json'
      headers['Authorization'] = 'Token token=' + CodeClimate::Client.api_token
      request_env[:request_headers].merge!(headers)

      @app.call(request_env).on_complete do |response_env|
        # do something with the response
        # response_env[:response_headers].merge!(...)
      end
    end
  end
end
