require 'domain_event'

module Domain
  module Events
    class UpdateBookGeneralInfo < DomainEvent
      include Virtus.model

      attribute :book_id, String
      attribute :title, String
      attribute :author, String
      attribute :published_date, String

      def self.create(book_id, title, author, published_date)
        new({book_id: book_id, title: title, author: author, published_date: published_date})
      end
    end
  end
end
