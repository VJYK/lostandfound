class FoundsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
	   if params[:category].blank?
	    @founds = Found.all.order("created_at DESC")
   	   else
      	@category_id =Category.find_by(name: params[:category]).id
      	@founds = Found.where(:category_id => @category_id).order("created_at DESC")
       end
  
	end

	def new
		@found = current_user.founds.build
		@category = Category.all.map { |c| [c.name, c.id] }
	end

	
	def create
  		@found = current_user.founds.build(found_params)
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
    	params.require(:found).permit(:item_name,:item_desc, :category_id, :user_id, :return)
    end
	
end
