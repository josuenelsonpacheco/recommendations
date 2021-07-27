class UserHistoryController < ApplicationController

  # Update User History records

  def update
    
    # PUT /user-history
    # Increase the collection_id count

    if params[:collection_id]

      userId = request.headers[:HTTP_USERID]
      Rails.logger.warn "Param HTTP_USERID: #{userId}"


    #  @user_history = UserHistory.where(:user_id => params[:user_id])
      @user_history = UserHistory.where(:user_id => userId)
      @collections = @user_history[0][:collections]

      if @collections[params[:collection_id]]
        @collections[params[:collection_id]] += 1
      else
        @collections[params[:collection_id]] = 1
        # insert as the first element
        # new_response = {new: 'new_value'}.merge(response)
      end

      #     Order array
      #     @user_history[0].update(collections: @collections.sort_by{|k, value| value}.reverse.to_h)
      @user_history[0].update(collections: @collections)

      @collections_history = @user_history[0][:collections_history]

      if @collections_history
        @collections_history.unshift(params[:collection_id])
      else
        @collections_history = [params[:collection_id]]      
      end

      @user_history[0].update(collections_history: @collections_history)   

    end

    if params[:product_id]

      userId = request.headers[:HTTP_USERID]
      Rails.logger.warn "Param HTTP_USERID: #{userId}"      

      @user_history = UserHistory.where(:user_id => userId)

      if @user_history.present? 


        @products = @user_history[0][:products]

        if @products[params[:product_id]]
          @products[params[:product_id]] += 1
        else
          @products[params[:product_id]] = 1
          # insert as the first element
          # new_response = {new: 'new_value'}.merge(response)
        end

        #     Order array
        #     @user_history[0].update(collections: @collections.sort_by{|k, value| value}.reverse.to_h)
        @user_history[0].update(products: @products)   

        @products_history = @user_history[0][:products_history]

        if @products_history
        # @products_history.unshift(params[:product_id])
        @products_history.insert(0,params[:product_id])
        else
          @products_history = [params[:product_id]]      
        end

        @user_history[0].update(products_history: @products_history)

      end      


    end

    # Check if array is not null

    if params[:product_id]


    end

    head :ok

  end

  protect_from_forgery with: :null_session
end