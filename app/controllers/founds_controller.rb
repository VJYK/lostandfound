class FoundsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
	   @founds= Found.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
	end

	def new
		@found = Found.new
		@category = Category.all
	end

	
	def create
  		@found = Found.new(found_params)
  		@found.user = current_user
  		
  		if @found.save
  			redirect_to founds_path, :notice => "Your post has be saved"
  		else
  			render "new"
  		end
     
  	end
	
	def show
		@lost = Found.find(params[:id])
	end
    
    private 
    
    def found_params
    	params.require(:found).permit(:item_name,:item_desc, :category_id, :user_id)
    end
	
end
