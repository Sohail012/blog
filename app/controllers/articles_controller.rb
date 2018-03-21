class ArticlesController < ApplicationController
	def new
		 @article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		@article.save
		redirect_to articles_path
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
		
    	@articles = current_user.articles
  	end

	def edit
 		 @article = Article.find(params[:id])
	end
 
	def update
	
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    	redirect_to articles_path
  		else
   		 render 'edit'
  	end
	end

	def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  	end

  	private
  		def article_params
    	params.require(:article).permit(:title, :text)
  	end

	end


