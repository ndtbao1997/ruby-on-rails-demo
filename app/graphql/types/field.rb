field :published_this_year, Boolean, "Has the book been published this year", null: false

def published_this_year
  object.year_published == Date.current.year
end