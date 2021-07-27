class CollectsController < ApplicationController

    def index
        @collect = Collect.all
        render json: @collect
    end

    def show
        @collect = Collect.find(params[:id])
        render json: @collect
    end

    def new
        @collect = Collect.new
        render json: @collect
    end   

    def create

        # Taking the parameters from the URL or the payload

        @collect = Collect.new(collection_id: params[:collection_id],product_id: params[:product_id])

        if @collect.save
            redirect_to @collect
        else
            render :new
        end
    end

    private
        def article_params
            params.require(:collect).permit(:collection_id, :product_id)
        end

    protect_from_forgery with: :null_session
  end