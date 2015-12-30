class ClothingsController < ApplicationController
  before_action :set_clothing, only: [:show, :edit, :update, :destroy]

  # GET /clothings
  def index
    @clothings = Clothing.all
  end

  # GET /clothings/1
  def show
  end

  # GET /clothings/new
  def new
    @clothing = Clothing.new
  end

  # GET /clothings/1/edit
  def edit
  end

  # POST /clothings
  def create
    @clothing = Clothing.new(clothing_params)

    if @clothing.save
      redirect_to @clothing, notice: 'Clothing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clothings/1
  def update
    if @clothing.update(clothing_params)
      redirect_to @clothing, notice: 'Clothing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clothings/1
  def destroy
    @clothing.destroy
    redirect_to clothings_url, notice: 'Clothing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clothing_params
      params.require(:clothing).permit(:name)
    end
end
