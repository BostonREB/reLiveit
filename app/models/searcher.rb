class Searcher

  def initialize(query)
    @query = query
  end

  def results
    find_artists
  end

  private
  attr_reader :query


  def find_artists
    Artist.where("name ILIKE :query", query: fuzzy_query)
  end

  def fuzzy_query
    "%#{query}%"
  end
end
