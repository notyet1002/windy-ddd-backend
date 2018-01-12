module CommandHandlers
  class MagazineCommandHandler

    def handle (command)
      case command.class.name
        when Contracts::Commands::Magazine::CreateMagazineCommand.name
          self.handle_create(command)
        when Contracts::Commands::Magazine::UpdateMagazineGeneralInfoCommand.name
          self.handle_update(command)
        when Contracts::Commands::Magazine::DeleteMagazineCommand.name
          self.handle_delete(command)
        else
          raise 'An error has occured'
      end
    end

    def handle_create(command)
      magazine = Magazine.new(:uuid=> command.uuid, :title => command.title, :author => command.author)
      magazine.save
    end

    def handle_update(command)
      magazine = Magazine.find(command.uuid)
      magazine.update({:title => command.title, :author => command.author, :published_date => command.published_date})
    end

    def handle_delete(command)
      magazine = Magazine.find(command.uuid)
      magazine.destroy
    end
  end
end