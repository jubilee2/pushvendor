class ConfigurationsController < ApplicationController
  before_action :set_and_authorize_configuration
  def index
  end

  def update
    if @configuration.update(configuration_params)
      flash[:notice] = 'Configurations have been successfully updated.'
    end
    render action: 'index'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_and_authorize_configuration
    @configuration = @configurations
    authorize! :read, @configuration
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def configuration_params
    params.require(:store_configuration).permit(:store_name,
                                                :store_description,
                                                :email_address,
                                                :phone_number,
                                                :website_url,
                                                :address,
                                                :city,
                                                :state,
                                                :zip,
                                                :currency,
                                                :tax_rate)
  end
end
