class RetrieveRecording

  def initialize(artist)
    @artist = artist
  end

  def get_api_data
    artist_name = artist.name.gsub(" ","+")
    raw_data = HTTParty.get("http://archive.org/advancedsearch.php?q=#{artist_name}&fl%5B%5D=collection&fl%5B%5D=date&fl%5B%5D=identifier&fl%5B%5D=publicdate&fl%5B%5D=title&sort%5B%5D=publicdate+desc&sort%5B%5D=&sort%5B%5D=&rows=50&page=1&output=json")
    recordings = raw_data['response']['docs']
    recordings.shift
    save_recordings(recordings)
  end

  private
  attr_reader :artist

  def save_recordings(recordings)
    recordings.map do |show|
      next if Recording.where(identifier: show['identifier']).exists?
      recording = Recording.new
      recording.artist_id = artist.id
      recording.date = show['date']
      recording.title = show['title']
      recording.collection = show['collection'][0]
      recording.upload_date = show['publicdate']
      recording.identifier = show['identifier']
      recording.save
    end.compact
  end
end
