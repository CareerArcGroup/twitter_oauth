module TwitterOAuth
  class Client
    
    # Enables device notifications for updates from the specified user.  
    # Returns the specified user when successful.
    def follow(id, options={})
      post("/notifications/follow.json?", options.merge(:user_id => id))
    end
    
    # Disables notifications for updates from the specified user to the authenticating user.  
    # Returns the specified user when successful.
    def leave(id, options={})
      post("/notifications/leave.json", options.merge(:user_id => id))
    end
    
  end
end
