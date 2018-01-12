module Contracts
  module Commands

    class Command
      attr_reader :uuid

      def initialize(uuid)
        @uuid = uuid
      end
    end
  end
end