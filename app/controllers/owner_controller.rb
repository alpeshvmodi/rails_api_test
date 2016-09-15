class OwnerController < ApplicationController

	before_filter :get_owner, :only => [:show, :articles]

	def index
		render :json => {:owners => Owner.select("name").collect{ |o| {name: o.name} }}
	end

	def show
		render :json => {owner_name: @owner.name}
	end

	def articles
		#raise params.inspect
		render :json => {owner_name: @owner.name, articles: @owner.articles}
	end

	def get_owner
		@owner = Owner.where(:name => params[:owner_name]).select("id, name").first
		render :json => {err: "#{params[:owner_name]} not found"}, status: 404 and return if @owner.blank?
	end

end
