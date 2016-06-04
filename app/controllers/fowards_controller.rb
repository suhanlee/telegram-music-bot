class FowardsController < ApplicationController
  before_action :set_foward, only: [:show, :edit, :update, :destroy]

  # GET /fowards
  # GET /fowards.json
  def index
    @fowards = Foward.all
  end

  # GET /fowards/1
  # GET /fowards/1.json
  def show
  end

  # GET /fowards/new
  def new
    @foward = Foward.new
  end

  # GET /fowards/1/edit
  def edit
  end

  # POST /fowards
  # POST /fowards.json
  def create
    @foward = Foward.new(foward_params)

    respond_to do |format|
      if @foward.save
        format.html { redirect_to @foward, notice: 'Foward was successfully created.' }
        format.json { render :show, status: :created, location: @foward }
      else
        format.html { render :new }
        format.json { render json: @foward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fowards/1
  # PATCH/PUT /fowards/1.json
  def update
    respond_to do |format|
      if @foward.update(foward_params)
        format.html { redirect_to @foward, notice: 'Foward was successfully updated.' }
        format.json { render :show, status: :ok, location: @foward }
      else
        format.html { render :edit }
        format.json { render json: @foward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fowards/1
  # DELETE /fowards/1.json
  def destroy
    @foward.destroy
    respond_to do |format|
      format.html { redirect_to fowards_url, notice: 'Foward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foward
      @foward = Foward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foward_params
      params.require(:foward).permit(:chat_id, :first_name, :last_name)
    end
end
