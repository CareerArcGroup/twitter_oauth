module TwitterOAuth
  class Client
    
    #
    # List methods
    #
    
    # Creates a new list for the authenticated user. Accounts are limited to 20 lists.
    def create_list(list, options={})
    # def create_list(user, list, options={})
      # post("/#{user}/lists.json", options.merge(:name => list))
      post("/lists/create.json", options.merge(:name => list)) # SMR - Replaced deprecated URL and removed unnecessary user param
    end
    
    # Updates the specified list.
    def update_list(list_id, options={})
    # def update_list(user, list_id, options={})
      # post("/#{user}/lists/#{list}.json", options)
      post("/lists/update.json", options.merge(:list_id => list_id)) # SMR - Replaced deprecated URL and updated parameters
    end
    
    # List the lists of the specified user. 
    # Private lists will be included if the authenticated user is the same as the user whose lists are being returned.
    def get_lists()
    # def get_lists(user)
      get("/lists.json")
    end
    
    # Show the specified list. Private lists will only be shown if the authenticated user owns the specified list.
    def get_list(list_id)
    # def get_list(user, list)
	    get("/lists/show.json?list_id=#{list_id}")
    end
    
    # Deletes the specified list. Must be owned by the authenticated user. 
    #def delete_list(user, list)
    def delete_list(list_id, options={})
      post("/lists/destroy.json", options.merge(:list_id => list_id))
    end
    
    # Show tweet timeline for members of the specified list.
    def list_statuses(list_id)
    #def list_statuses(user, list)
      get("/lists/statuses.json?list_id=#{list_id}")
    end
    
    # List the lists the specified user has been added to.
    def list_memberships(user_id)
      get("/lists/memberships.json?user_id=#{user_id}")
    end
    
    # List the lists the specified user follows.
    def list_subscriptions(user_id)
      get("lists/subscriptions.json?user_id=#{user_id}")
    end
    
    #
    # List Members Methods
    #
    
    # Returns the members of the specified list.
    def list_members(list_id)
    #def list_members(user, list)
      get("/lists/members.json?list_id=#{list_id}")
    end
    
    # Add a member to a list. The authenticated user must own the list to be able to add members to it. 
    # Lists are limited to having 500 members.
    def add_member_to_list(list_id, member_id, options={})
    #def add_member_to_list(user, list, member_id, options={})
      post("/lists/members/create.json?", options.merge(:list_id => list_id, :user_id => member_id))
    end
    
    # Removes the specified member from the list. 
    # The authenticated user must be the list's owner to remove members from the list.
    def remove_member_from_list(list_id, member_id)
    #def remove_member_from_list(user, list, member_id)
      post("/lists/members/destroy.json", options.merge(:list_id => list_id, :user_id => member_id))
    end
    
    # Check if a user is a member of the specified list.
    def get_member_of_list(list_id, member_id)
    #def get_member_of_list(user, list, member_id)
      get("/lists/members/show.json?list_id=#{list_id}&user_id=#{member_id}")
    end
    
    #
    # List Subscribers Methods
    #
    
    # Returns the subscribers of the specified list.
    def list_subscribers(list_id)
    #def list_subscribers(user, list)
      get("/lists/subscribers.json?list_id=#{list_id}")
    end
    
    # Make the authenticated user follow the specified list.
    def subscribe_to_list(list_id, options={})
    #def subscribe_to_list(user, list, options={})
      post("/lists/subscribers/create.json", options.merge(:list_id => list_id))
    end
    
    # Unsubscribes the authenticated user form the specified list.
    def unsubscribe_from_list(list_id, options={})
    #def unsubscribe_from_list(user, list)
      post("/lists/subscribers/destroy.json", options.merge(:list_id => list_id))
    end
    
    # Check if the specified user is a subscriber of the specified list.
    def get_subscriber_of_list(list_id, subscriber_id)
    #def get_subscriber_of_list(user, list, subscriber_id)
      get("/lists/subscribers/show.json?list_id=#{list_id}&user_id=#{subscriber_id}")
    end
    
  end
end