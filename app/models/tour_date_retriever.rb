class TourDateRetriever
  attr_reader :artist, :user
  SONGKICK_API_KEY = ENV.fetch('SONGKICK_API_KEY')

  def initialize(artist)
    @artist = artist
  end

  def get_tour_api_data
    remote = Songkickr::Remote.new SONGKICK_API_KEY
    performances = remote.events(artist_name: artist.name)
    save_tour_dates(performances)
  end

  private

  def save_tour_dates(shows)
    shows.results.map do |event|
      if event_unique?(event)
        next
      end
      Show.create(show_params(event))
    end.compact
  end

  def event_unique?(event)
    Show.where(songkick_id: event.id).exists?
  end

  def show_params(event)
    {
      date: event.start,
      uri: event.uri,
      songkick_id: event.id,
      artist_id: artist.id,
      city: event.location.city,
      venue: event.venue.display_name,
      artist_name: artist.name
    }
  end
end
