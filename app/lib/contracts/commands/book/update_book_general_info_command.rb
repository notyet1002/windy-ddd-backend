module Contracts
  module Commands
    module Book
      class UpdateBookGeneralInfoCommand < Command
        attr_reader :title, :author, :published_date

        def initialize(uid, title, author, published_date)
          super(uid)

          @title = title
          @author = author
          @published_date = published_date
        end
      end
    end
  end
end