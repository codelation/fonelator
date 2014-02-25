require_dependency "fonelator/application_controller"

module Fonelator
  class PhonesController < ApplicationController
    before_action :authorize_user
    before_action :set_phone, only: [:show, :edit, :update, :destroy]
    respond_to :html

    # GET /phones
    def index
      @phones = Fonelator::Phone.where(user_id: fonelator_current_user.id).all
      respond_with @phones
    end

    # GET /phones/1
    def show
      respond_with @phone
    end

    # GET /phones/new
    def new
      @phone = Fonelator::Phone.new
    end

    # GET /phones/1/edit
    def edit
    end

    # POST /phones
    def create
      @phone = Fonelator::Phone.new(phone_params)
      @phone.user_id = fonelator_current_user.id

      if @phone.save
        redirect_to phone_path(@phone), notice: 'Phone was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /phones/1
    def update
      if @phone.update(phone_params)
        redirect_to phone_path(@phone), notice: 'Phone was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /phones/1
    def destroy
      @phone.destroy
      redirect_to phones_path, notice: 'Phone was successfully destroyed.'
    end

    private

    def authorize_user
      authorize! :manage, Fonelator::Phone
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Fonelator::Phone.where(id: params[:id], user_id: fonelator_current_user.id).take
    end

    # Only allow a trusted parameter "white list" through.
    def phone_params
      params.require(:phone).permit(:name, :number, :is_sip, :is_active)
    end
  end
end
