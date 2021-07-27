class RecommendationsController < ApplicationController

    protect_from_forgery with: :null_session

    # GET /recommendations/available-collection-seeds
    # Retrieve collection products   

    def available_collection_seeds

        # Get available collection seeds for a specific user

        if params[:userid]
            @user_history = UserHistory.where(:userid => params[:userid])
            @collection_ids = @user_history[0][:collections]

  #          if params[:page] && params[:per]
  #              @collection_ids = Kaminari.paginate_array(@collection_ids_2).page(params[:page]).per(params[:per])
  #          else
  #              @collection_ids = @user_history[0][:collections]
  #          end

            colls = []

            @collection_ids.each_with_index do |(key,value),index|
               colls[index] = Collection.find(key)
            end
           
            if params[:page] && params[:per]
                @collection = Kaminari.paginate_array(colls).page(params[:page]).per(params[:per])
            else
                @collection = colls
            end
        else

            # Get available collection seeds for generic user

            if params[:page] && params[:per]
                @collection = Collection.page(params[:page]).per(params[:per])#Page(1)#skip(2).limit(10)#paginate(:page => 1, :limit => 10).desc(:_id          
            else
                @collection = Collection.all
            end
        end

        render json: {collections: @collection}
    end

    def products
        @product = Product.all
        render json: @product
    end    

    def show
        @collection = Collection.find(params[:id])
        render json: @collection
    end

    def new
        @collection = Collection.new
        render json: @collection
    end   

    def create

        # Taking the parameters from the URL or the payload

        @collection = Collection.new(type: params[:type],name: params[:name])

        if @collection.save
            redirect_to @collection
        else
            render :new
        end
    end

    private
        def article_params
            params.require(:collection).permit(:type, :name)
        end
  end