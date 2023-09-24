class Api::V1::ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show update destroy ]

  # GET /profiles
  def index
    @profiles = Profile.order(created_at: :desc)

    render json: @profiles
  end

  # GET /profiles/1
  def show
    render json: @profile
  end

  # profile /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: api_v1_profile_url(@profile)
    else
      render json: @profile.errors , status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :cpf, :phone, :city, :email)
    end
end
