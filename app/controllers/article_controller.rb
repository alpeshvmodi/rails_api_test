class ArticleController < ApplicationController
	def show
		article = Article.where(:id => params[:id]).select("id, owner_id, name, price, description").first
		render :json => {err: "Article not found"}, status: 404 and return if article.blank?
		render :json => {:owner_name => article.owner.name}.merge(article.attributes)
	end
end
