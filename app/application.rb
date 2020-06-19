class Application
  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new 

    if req.path.match(/items/)
      item = req.path.split('/items/').last
      if @@items.find{ |i| i.name == item}
        item_found = @@items.find{ |i| i.name == item}
        resp.write item_found.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
      resp.finish

  end

end