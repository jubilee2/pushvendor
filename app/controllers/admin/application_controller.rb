# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit

    def authorized_action?(_resource, _action_name)
      can? _action_name.to_sym, _resource
    end

    rescue_from Administrate::NotAuthorizedError do |exception|
      redirect_to root_url, alert: 'Not Authorized Error'
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
