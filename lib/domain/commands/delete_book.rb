module Domain
  module Commands
    class DeleteBook < Command
      attribute :book_id, String
      attribute :title, String
      attribute :author, String
      attribute :published_date, String

      validates :book_id, presence: true

      alias :aggregate_id :book_id
    end
  end
end