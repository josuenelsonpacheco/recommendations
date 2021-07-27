class CollectionsController < ApplicationController

    # GET /collections/products/:id/products
    # Retrieve collection products

    def collection_products
     
        if params[:id]

            if params[:page] && params[:per]
                @collects = Collect.where(:collection_id => params[:id]).page(params[:page]).per(params[:per])                
            else
                @collects = Collect.where(:collection_id => params[:id])
            end           

            @product_ids = []

            @collects.each_with_index do |val, index|
                @product_ids[index] = @collects[index][:product_id]
            end            

            render json: {products: @product_ids}
        end            
    end

    # GET /collections

    def index

        if params[:page] && params[:per]
            @collection = Collection.page(params[:page]).per(params[:per])    
        else
            @collection = Collection.all
        end

        render json: @collection
    end

    # GET /collections/:id

    def show
        @collection = Collection.find(params[:id])
        render json: @collection
    end

    # POST /collections

    def create

        # Taking the parameters from the URL or the payload

    #    @collection = Collection.new(type: params[:type],name: params[:name])

        @collection = Collection.new(collection_params)

        if @collection.save
            redirect_to @collection
        else
            render :new
        end
    end

    # PUT /collections/:id

   def update
        
        @collection = Collection.find(params[:id])

        if @collection
            @collection.update(collection_params)
            redirect_to @collection
        end
    end

    private

    def collection_params
        #params.require(:collection).permit(:type, :name, :description)
        params.permit(:type, :name, :description)
    end

    protect_from_forgery with: :null_session
  end