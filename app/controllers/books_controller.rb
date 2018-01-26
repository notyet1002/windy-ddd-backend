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
    command = Domain::Commands::CreateBook.new(book_params)
    handle(command)

    render status: :created
  end

  # PATCH/PUT /books/1
  def update
    command = Domain::Commands::UpdateBookGeneralInfo.new(book_params)
    handle(command)

    render status: :accepted
  end

  # DELETE /books/1
  def destroy
    command = Domain::Commands::DeleteBook.new(book_params)
    handle(command)

    render status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    args = params.require(:book).permit(:uuid, :title, :author, :published_date)

    {uuid: args[:uuid], title: args[:title], author: args[:author], published_date: args[:published_date]}
  end
end