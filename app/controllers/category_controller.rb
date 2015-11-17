class CategoryController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def create
	end

	def update
	end
end