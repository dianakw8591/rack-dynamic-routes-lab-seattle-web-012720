class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
        search = req.path.split("/items/").last
        result = Item.all.find {|item| item.name == search}
        if result
            resp.write "#{result.price}"
        else
            resp.write "Item not found"
            resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end