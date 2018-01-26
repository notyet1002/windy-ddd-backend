require 'domain_event'

module Domain
  module Events
    class BookDeleted < DomainEvent
      include Virtus.model

      attribute :book_id, String

      def self.create(book_id)
        new({book_id: book_id})
      end
    end
  end
end
