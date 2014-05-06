class RecordingRetriever

  def initialize(artist)
    @artist = artist
  end

  def get_api_data
    artist_name = artist.name.gsub(" ","+")
    raw_data = HTTParty.get("http://archive.org/advancedsearch.php?q=#{artist_name}&fl%5B%5D=collection&fl%5B%5D=date&fl%5B%5D=identifier&fl%5B%5D=publicdate&fl%5B%5D=title&sort%5B%5D=publicdate+desc&sort%5B%5D=&sort%5B%5D=&rows=50&page=1&output=json")
    recordings = raw_data['response']['docs']
    save_recordings(recordings)
  end

  private
  attr_reader :artist

  def save_recordings(recordings)
    recordings.map do |show|
      if recording_unique?(show) && verify_for_artist?(show)
        next
      end
      Recording.create(recording_params(show))
    end.compact
  end

  def recording_params(show)
    show.
      slice('date', 'title', 'identifier').
      merge(artist_id: artist.id, collection: show['collection'][0], upload_date: show['publicdate'])
  end

  def verify_for_artist?(show)
    show["collection"] != @artist.name.gsub(" ", "")
  end

  def recording_unique?(show)
    Recording.where(identifier: show['identifier']).exists?
  end
end
