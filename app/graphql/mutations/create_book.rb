class Mutations::CreateBook < Mutations::BaseMutation
  argument :title, String, required: true
  argument :pages, Integer, required: true
  argument :year_published, Integer, required: false
  argument :author_id, Integer, required: false

  type Types::BookType

  def resolve(title:, pages:, year_published:, author_id:)
    Book.create!(
      title: title,
      pages: pages,
      year_published: year_published,
      author_id: author_id
    )
  end
end
