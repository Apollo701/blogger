class ArticlesController < ApplicationController
	include ArticlesHelper
	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to article_path(@article)
		else
			redirect_to new_article_path
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash.notice = "Article '#{@article.title}' Updated!"
			redirect_to article_path(@article)
		else
			redirect_to edit_article_path(@article)
		end
	end
end
