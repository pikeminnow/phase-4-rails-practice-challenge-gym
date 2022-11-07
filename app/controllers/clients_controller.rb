class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find(params[:id])
        render json: client
    end

    private

    def render_not_found_response(exception)
        render json: exception, status: :not_found
    end

end
