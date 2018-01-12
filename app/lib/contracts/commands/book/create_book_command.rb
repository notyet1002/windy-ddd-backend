module Contracts
  module Commands
    module Book

      class CreateBookCommand < Command
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