class AlligatorsController < ApplicationController
  before_action :set_alligator, only: [:show, :edit, :update, :destroy]

  # GET /alligators
  # GET /alligators.json
  def index
    @alligators = Alligator.all
  end

  # GET /alligators/1
  # GET /alligators/1.json
  def show
  end

  # GET /alligators/new
  def new
    @alligator = Alligator.new
  end

  # GET /alligators/1/edit
  def edit
  end

  # POST /alligators
  # POST /alligators.json
  def create
    @alligator = Alligator.new(alligator_params)

    respond_to do |format|
      if @alligator.save
        format.html { redirect_to @alligator, notice: 'Alligator was successfully created.' }
        format.json { render :show, status: :created, location: @alligator }
      else
        format.html { render :new }
        format.json { render json: @alligator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alligators/1
  # PATCH/PUT /alligators/1.json
  def update
    respond_to do |format|
      if @alligator.update(alligator_params)
        format.html { redirect_to @alligator, notice: 'Alligator was successfully updated.' }
        format.json { render :show, status: :ok, location: @alligator }
      else
        format.html { render :edit }
        format.json { render json: @alligator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alligators/1
  # DELETE /alligators/1.json
  def destroy
    @alligator.destroy
    respond_to do |format|
      format.html { redirect_to alligators_url, notice: 'Alligator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alligator
      @alligator = Alligator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alligator_params
      params.require(:alligator).permit(:name)
    end
end
