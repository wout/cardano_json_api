class AppServer < Lucky::BaseAppServer
  # Learn about middleware with HTTP::Handlers:
  # https://luckyframework.org/guides/http-and-routing/http-handlers
  def middleware : Array(HTTP::Handler)
    [
      Lucky::ForceSSLHandler.new,
      Lucky::HttpMethodOverrideHandler.new,
      Lucky::LogHandler.new,
      LuckySwagger::Handlers::WebHandler.new(
        swagger_url: "/swagger",
        folder: "./swagger"
      ),
      Lucky::ErrorHandler.new(action: Errors::Show),
      Lucky::RemoteIpHandler.new,
      Lucky::RouteHandler.new,
      Lucky::RouteNotFoundHandler.new,
    ] of HTTP::Handler
  end

  def protocol
    "http"
  end

  def listen
    # Learn about bind_tcp: https://tinyurl.com/bind-tcp-docs
    server.bind_tcp(host, port, reuse_port: false)
    server.listen
  end
end
