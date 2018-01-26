module Domain
  module CommandHandlers
    class DeleteBook
      include CommandHandler

      def call(command)
        with_aggregate(command.aggregate_id) do |book|
          book.delete
        end
      end

      def aggregate_class
        Domain::Book
      end
    end
  end
end
