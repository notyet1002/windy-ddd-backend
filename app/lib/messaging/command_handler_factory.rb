module Messaging
  class CommandHandlerFactory

    def initialize
      @book_command_handler = CommandHandlers::BookCommandHandler.new
      @magazine_command_handler = CommandHandlers::MagazineCommandHandler.new
    end

    def factory(command_handler, command)

      if command_handler == CommandHandlers::BookCommandHandler.name
        @book_command_handler.handle(command)
      elsif command_handler == CommandHandlers::MagazineCommandHandler.name
        @magazine_command_handler.handle(command)
      end
    end
  end
end