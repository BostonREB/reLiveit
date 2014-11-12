class RecordingRetriever
  attr_reader :artist

  def initialize(artist)
    @artist = artist
  end

  def get_api_data
    artist_name = artist.name.gsub(/[^0-9A-Za-z ]/, '')
    artist_name = artist_name.gsub(" ","+")
    raw_data = HTTParty.get("http://archive.org/advancedsearch.php?q=#{artist_name}&fl%5B%5D=collection&fl%5B%5D=date&fl%5B%5D=identifier&fl%5B%5D=publicdate&fl%5B%5D=title&sort%5B%5D=publicdate+desc&sort%5B%5D=&sort%5B%5D=&rows=200&page=1&output=json")
    recordings = raw_data['response']['docs']
    save_recordings(recordings)
  end

  private

  def save_recordings(recordings)
    recordings.map do |show|
      if [show["date"], show["title"], show["identifier"], show["collection"], show["publicdate"]].any? {|field| field.blank?}
        next
      end
      if recording_unique?(show) || is_show?(show)
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

  def is_show?(show)
    (show["collection"][0].downcase != artist.name.gsub(" ", "").downcase)
  end

  def recording_unique?(show)
    Recording.where(identifier: show['identifier']).exists?
  end

  def good_date(show)
    show["date"].empty?
  end

end
