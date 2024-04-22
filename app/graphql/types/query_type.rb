module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    def authors
      Author.all
    end

    field :author, Types::AuthorType, null: false do
      argument :id, ID, required: true
    end
    def author(id:)
      Author.find(id)
    end

    field :author_with_books, Types::AuthorType, null: false do
      argument :id, ID, required: true
    end
    def author_with_books(id:)
      Author.includes(:books).find(id)
    end
  end
end
