require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)

    if req.cookies[:_rails_lite_app]
      @ivar =  (JSON req.cookies[:_rails_lite_app])
    else
      @ivar ={}
    end
    # @ivar = req._rails_lite_app || {}
  end

  def [](key)
    @ivar[key]

  end

  def []=(key, val)
    @ivar[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie(:_rails_lite_app, 
      { path: "/",
        value: (JSON @ivar)
      })
  end
end
