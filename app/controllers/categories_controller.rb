class CategoriesController < ApplicationController
	def index
      @category = Category.all
	end

	def show
       @category = Category.find(params[:id])
       @title = @category.name
       @losts = @category.lost
       @founds = @category.found
	end
end
