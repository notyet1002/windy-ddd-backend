module Contracts
  module Commands
    module Magazine
      class UpdateMagazineGeneralInfoCommand < Command
        attr_reader :title, :author, :published_date

        def initialize(uuid, title, author, published_date)
          super(uuid)

          @title = title
          @author = author
          @published_date = published_date
        end
      end
    end
  end
end