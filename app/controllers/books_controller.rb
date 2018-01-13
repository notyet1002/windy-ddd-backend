class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :create_command_bus, only: [:create, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @command = Contracts::Commands::Book::CreateBookCommand.new(
        book_params[:uuid],
        book_params[:title],
        book_params[:author]
    )

    @command_bus.send(CommandHandlers::BookCommandHandler.name, @command)

    render status: :created
  end

  # PATCH/PUT /books/1
  def update
    @command = Contracts::Commands::Book::UpdateBookGeneralInfoCommand.new(
        params[:id],
        book_params[:title],
        book_params[:author],
        book_params[:published_date]
    )
    @command_bus.send(CommandHandlers::BookCommandHandler.name, @command)

    render status: :accepted
  end

  # DELETE /books/1
  def destroy
    @command = Contracts::Commands::Book::DeleteBookCommand.new(params[:id])
    @command_bus.send(CommandHandlers::BookCommandHandler.name, @command)

    render status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:uuid, :title, :author, :published_date, :is_active, :count)
  end
end