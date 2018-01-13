class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show]
  before_action :create_command_bus, only: [:create, :update, :destroy]

  # GET /magazines
  def index
    @magazines = Magazine.all

    render json: @magazines
  end

  # GET /magazines/1
  def show
    render json: @magazine
  end

  # POST /magazines
  def create
    @command = Contracts::Commands::Magazine::CreateMagazineCommand.new(
        magazine_params[:uuid],
        magazine_params[:title],
        magazine_params[:author]
    )
    @command_bus.send(CommandHandlers::MagazineCommandHandler.name, @command)

    render status: :created
  end

  # PATCH/PUT /magazines/1
  def update
    @command = Contracts::Commands::Magazine::UpdateMagazineGeneralInfoCommand.new(
        params[:id],
        magazine_params[:title],
        magazine_params[:author],
        magazine_params[:published_date]
    )
    @command_bus.send(CommandHandlers::MagazineCommandHandler.name, @command)
    render status: :accepted
  end

  # DELETE /magazines/1
  def destroy
    @command = Contracts::Commands::Magazine::DeleteMagazineCommand.new(params[:id])
    @command_bus.send(CommandHandlers::MagazineCommandHandler.name, @command)

    render status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_magazine
    @magazine = Magazine.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def magazine_params
    params.require(:magazine).permit(:uuid, :title, :author, :published_date, :is_active, :count)
  end
end
