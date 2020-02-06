require 'rack'
require_relative '../lib/controller_base'
require_relative '../lib/session'
require 'byebug'

class MyController < ControllerBase

  attr_reader :session
  def go
    session["count"] ||= 0
    session["count"] += 1
    render :counting_show
  end
  def initialize(req, res)
    @req = req
    @res = res
  end

  def session
    @session ||= Session.new(@req)
  end

  def render_content(content, content_type)
    unless @already_built_response
      @res['Content-Type'] = content_type
      debugger
      @res.write(content)
      session.store_session(@res)
      @already_built_response = true
    else
      flash[:errors] = ["already built response!"]
    end
  end

  def redirect_to(url)
    unless @already_built_response
      @res.status = 302
      @res.location = url
      session.store_session(@res)
      # debugger
      @already_built_response = true
    else
      flash[:errors] = ["already built response!"]
    end
  end

  def render(template_name)
    template_path = File.join("views/" + self.class.to_s.underscore + "/#{template_name}.html.erb")

    template_content = File.read(template_path)
    # debugger
    content = ERB.new(template_content).result(binding)
    # debugger
    render_content(content,'text/html')
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
