class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "sam", password: "12345", except: [:index, :show]
	
	def new
		@article = Article.new
	end
  
  # create
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	# read
	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.order('created_at DESC')
	end

	def edit 
		@article = Article.find(params[:id])
	end

	# update
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else 
			render 'edit'
		end
	end

	# destroy
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
