class ArticlesController < ApplicationController

    def index
        @articles = Article.all
        render json: @articles
    end

    def show
        @article = Article.find(params[:id])
        render json: @article
    end

    def new
        @article = Article.new
        render json: @article
    end   

    def create

        # Taking the parameters from the URL or the payload

        @article = Article.new(title: params[:title],text: params[:text])
        #@article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

    protect_from_forgery with: :null_session
  end