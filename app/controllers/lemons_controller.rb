class LemonsController < ApplicationController
  before_action :set_lemon, except: [:index, :new, :create]

  def index
    @lemons = Lemon.all
  end

  def show
  end

  def new
    @lemon = Lemon.new
  end

  def edit
  end

  def create
    @lemon = Lemon.new lemon_params

    if @lemon.save
      redirect_to @lemon, notice: "Woohoo!"
    else
      render :new
    end
  end

  def update
    if @lemon.update lemon_params
      respond_to do |format|
        format.html { redirect_to @lemon, notice: "Updated!!" }
        format.js
      end
    else
      render :edit
    end
  end

  def form
    respond_to do |format|
      format.js
    end
  end

  private
    def set_lemon
      @lemon = Lemon.find(params[:id])
    end

    def lemon_params
      params.require(:lemon).permit(:name, :species, :description)
    end
end
