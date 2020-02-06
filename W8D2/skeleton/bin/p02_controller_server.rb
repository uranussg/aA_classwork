require 'rack'
require_relative '../lib/controller_base'
require 'byebug'

class MyController < ControllerBase
  def initialize(req, res)
    @req = req
    @res = res
  end
  def go
    if req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end

  def render_content(content, content_type)
    unless @already_built_response
      @res['Content-Type'] = content_type
      debugger
      @res.write(content)
      @already_built_response = true
    else
      flash[:errors] = ["already built response!"]
    end
  end

  def redirect_to(url)
    unless @already_built_response
      @res.status = 302
      @res.location = url
      @already_built_response = true
    else
      flash[:errors] = ["already built response!"]
    end
  end
end
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)

