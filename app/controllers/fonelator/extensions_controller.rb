require_dependency "fonelator/application_controller"

module Fonelator
  class ExtensionsController < ApplicationController
    autocomplete :fonelator_extension, :name, class_name: "Fonelator::Extension"
    before_action :authorize_user
    before_action :set_extension, only: [:show, :edit, :update, :destroy]
    respond_to :html

    # GET /extensions
    def index
      @extensions = Fonelator::Extension.all
      respond_with @extensions
    end

    # GET /extensions/1
    def show
      respond_with @extension
    end

    # GET /extensions/new
    def new
      @extension = Fonelator::Extension.new
    end

    # GET /extensions/1/edit
    def edit
    end

    # POST /extensions
    def create
      @extension = Fonelator::Extension.new(extension_params)

      if @extension.save
        redirect_to extension_path(@extension), notice: 'Extension was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /extensions/1
    def update
      if @extension.update(extension_params)
        redirect_to extension_path(@extension), notice: 'Extension was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /extensions/1
    def destroy
      @extension.destroy
      redirect_to extensions_path, notice: 'Extension was successfully destroyed.'
    end

    private

    def authorize_user
      authorize! :manage, Fonelator::Extension
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_extension
      @extension = Fonelator::Extension.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def extension_params
      params.require(:extension).permit(:name, :is_listed, :number)
    end
  end
end
