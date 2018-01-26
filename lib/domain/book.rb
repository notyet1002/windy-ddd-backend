module Domain
  class Book
    include AggregateRoot

    AlreadyCreated = Class.new(StandardError)

    def initialize(uuid = SecureRandom.uuid)
      @uuid = uuid
      @state = :draft
    end

    def create(title, author, published_date)
      raise AlreadyCreated unless state == :draft

      apply Events::BookCreated.create(@uuid, title, author, published_date)
    end

    def update_general_info(product_id)
      raise AlreadyCreated unless state == :draft
      apply Events::UpdateBookGeneralInfo.create(@uuid, title, author, published_date)
    end

    def delete
      apply Events::BookDeleted.create(@uuid)
    end

    def apply_book_created(event)
      @title = event.title
      @author = event.author
      @published_date = event.published_date
      @state = :created
    end

    def apply_book_update_general_info(event)
      @title = event.title
      @author = event.author
      @published_date = event.published_date
      @state = :created
    end

    def apply_book_deleted(event)
      # delete book event
    end

    private
    attr_accessor :uuid, :title, :author, :published_date
  end
end
