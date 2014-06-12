class Searcher

  def initialize(query)
    @query = query
  end

  def results
    if existing_artists.exists?
      existing_artists
    else
      Artist.none
    end
  end

  private
  attr_reader :query


  def existing_artists
    Artist.where("name ILIKE :query", query: fuzzy_query)
  end

  def new_artist

  end

  def fuzzy_query
    "%#{query}%"
  end
end
