module Contracts
  module Commands
    module Magazine

      class CreateMagazineCommand < Command
        attr_reader :title, :author

        def initialize(uuid, title, author)
          super(uuid)

          @title = title
          @author = author
        end
      end
    end
  end
end