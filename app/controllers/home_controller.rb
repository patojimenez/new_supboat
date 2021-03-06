class HomeController < ApplicationController
  def index
    # @response = HTTParty.get('http://api.meetup.com/2/events/?status=upcoming&order=time&limited_events=False&group_urlname=startupchile&desc=false&offset=0&format=json&page=20&fields=&sig_id=12911163&sig=014424a15746b3acbbd04395abc44da6d1750774')
    @latam =HTTParty.get('http://api.meetup.com/2/events?status=upcoming&event_id=120898122%2C119369492&order=time&limited_events=False&group_urlname=startupchile&desc=false&offset=0&format=json&page=20&fields=&sig_id=12911163&sig=a92dca4ee46971de8b1016dcaf81d79b3b893ae4')
    @latam = @latam["results"]
    
    @latam.each do |country|
      u = Country.new(country["venue"]["country"].upcase)
      country["venue"]["country"] = u.name
    end

    @europa = HTTParty.get('http://api.meetup.com/2/events?status=upcoming&event_id=124135132%2C121029312%2C124112762&order=time&limited_events=False&desc=false&offset=0&format=json&page=20&fields=&sig_id=12911163&sig=e3d2f651481f0da1d4a6c0d9ff87f5cc94799c10')
    @europa = @europa["results"]

    @asia = HTTParty.get('http://api.meetup.com/2/events?status=upcoming&event_id=122051032&order=time&limited_events=False&desc=false&offset=0&format=json&page=20&fields=&sig_id=12911163&sig=e4c810fe20ab3fb9994e877b142b1b74fab052f7')
    @asia = @asia["results"]

    @norte = HTTParty.get('http://api.meetup.com/2/events?status=upcoming&event_id=122253642%2C122051032&order=time&limited_events=False&desc=false&offset=0&format=json&page=20&fields=&sig_id=12911163&sig=d5f1ef2d2c52ec7594977b987310f47f16ba35de')
    @norte = @norte["results"]



  end
end
