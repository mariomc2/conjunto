class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]
  before_action :set_apartment
  before_action :authenticate_user!

  # GET /residents
  # GET /residents.json
  def index
    @residents = @apartment.residents
  end

  # GET /residents/1
  # GET /residents/1.json
  def show
  end

  # GET /residents/new
  def new
    @resident = Resident.new
  end

  # GET /residents/1/edit
  def edit
  end

  # POST /residents
  # POST /residents.json
  def create
    @resident = Resident.new(resident_params)

    respond_to do |format|
      if @resident.save
        format.html { redirect_to apartment_resident_path(@apartment, @resident), notice: 'Resident was successfully created.' }
        format.json { render :show, status: :created, location: @resident }
      else
        format.html { render :new }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residents/1
  # PATCH/PUT /residents/1.json
  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to apartment_resident_path(@apartment, @resident), notice: 'Resident was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residents/1
  # DELETE /residents/1.json
  def destroy
    @resident.destroy
    respond_to do |format|
      format.html { redirect_to apartment_residents_path(@apartment), notice: 'Resident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:apartment_id])
    end

    def set_resident
      @resident = Resident.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resident_params
      params.require(:resident).permit(:name, :email, :telephone, :apartment_id)
    end
end
