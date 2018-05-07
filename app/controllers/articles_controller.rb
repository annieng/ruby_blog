class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "ricericebaby", password: "RiceRice"

    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    # manually defining a method
    def new
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
    end

    # manually creating a new action for endpoint
    def create
        # making sure to use capital A to reer to our previously
        # defined model class, saves data to our controller
        @article = Article.new(params.require(:article).permit(:title, :text))

        # if article is invalid will return user to form
        if @article.save
          # will return a boolean
          redirect_to @article
        else
          render 'new'
        end
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
    end
    # private means that it can't be called outside of its context
    private
      def article_params
        params.require(:article).permit(:title, :text)
      end
end
