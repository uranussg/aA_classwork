require 'rack'
require_relative '../lib/controller_base'
require 'active_support/inflector'
require 'byebug'

class MyController < ControllerBase
  def initialize(req, res)
    @req = req
    @res = res
  end
  def go
    render :show
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

  def render(template_name)
    template_path = File.join("views/" + self.class.to_s.underscore + "/#{:show}.html.erb")

    template_content = File.read(template_path)
    debugger
    content = ERB.new(template_content).result(binding)
    debugger
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

  # p  cur_name = File.dirname(__FILE__)
  # p  template_path = File.join("views/" + self.to_s.underscore + "/#{:show}.html.erb")