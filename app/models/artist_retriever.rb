class ArtistRetriever
  attr_reader :artist, :user

  # def initialize(artist)
  #   @artist = artist
  # end

  def get_artists
    raw_data = HTTParty.get("http://archive.org/advancedsearch.php?q=mediatype%3Acollection+AND+collection%3Aetree&fl%5B%5D=identifier&fl%5B%5D=title&sort%5B%5D=titleSorter+asc&sort%5B%5D=&sort%5B%5D=&rows=15000&page=1&indent=yes&output=json")
    artists = raw_data['response']['docs']
    save_artists(artists)
  end

  private

  def save_artists(artists)
    artists.map do |artist|
      if artist_unique?(artist)
        next
      end
      Artist.create(artist_params(artist))
    end.compact
  end

  def artist_params(artist)
    {
      name: artist['title']
    }
  end

  def artist_unique?(artist)
    Artist.where(name: artist['title']).exists?
  end
end
