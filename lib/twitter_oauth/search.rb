require 'open-uri'

module TwitterOAuth
  class Client

    # Returns the current top 10 trending topics on Twitter.
    def current_trends(woeid=1)
      get("/trends/#{woeid}.json")
    end
    
    # Returns the top 20 trending topics for each hour in a given day.
    def daily_trends
      get("/trends/daily.json")
    end
    
    # Returns the top 30 trending topics for each day in a given week.
    def weekly_trends
      get("/trends/weekly.json")
    end

  end
end