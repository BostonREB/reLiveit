namespace :get_data do

  desc "Get bootleg data from Live Music Archive"
  task :lma => :environment do
    artists = Artist.all
    artists.each do |artist|
      lma_recordings = RecordingRetriever.new(artist)
      lma_recordings.get_api_data
    end
  end

  desc "Get tour data from Songkick"
  task :songkick => :environment do
    artists = Artist.all
    artists.each do |artist|
      artist_tour_dates = TourDateRetriever.new(artist)
      artist_tour_dates.get_tour_api_data
    end
  end
end
