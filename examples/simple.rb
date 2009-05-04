
class Article
  include DMLite::Model

  property :id,     Integer   # Key is assumed from first defined property, if none is set
  property :title,  String
  property :text,   String

  property :author_id,    Integer
  property :published_at, DateTime

  has n, :comments
  belongs_to :author

end

# Follow the api of Enumerable and Array as close as possible

Article.find_all(:author => 'Paul')  # alias select & all
Article.find(:title => /DataMapper/) # alias detect & first

Article[42]                          # alias get & slice

# Squirrel-like finders, and chained query building
articles = Article.find_all { published_at > 2.weeks.ago }
articles.first(10)





