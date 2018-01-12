module CommandHandlers
  class BookCommandHandler

    def handle (command)
      case command.class.name
        when Contracts::Commands::Book::CreateBookCommand.name
          self.handle_create(command)
        when Contracts::Commands::Book::UpdateBookGeneralInfoCommand.name
          self.handle_update(command)
        when Contracts::Commands::Book::DeleteBookCommand.name
          self.handle_delete(command)
        else
          raise 'An error has occured'
      end
    end

    def handle_create(command)
      book = Book.new(:uuid => command.uuid, :title => command.title, :author => command.author)
      book.save
    end

    def handle_update(command)
      book = Book.find(command.uuid)
      book.update({:title => command.title, :author => command.author, :published_date => command.published_date})
    end

    def handle_delete(command)
      book = Book.find(command.uuid)
      book.destroy
    end
  end
end