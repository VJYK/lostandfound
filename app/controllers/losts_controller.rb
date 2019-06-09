class LostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    
	def index
	   @losts = Lost.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
	end

	def new
		@lost = Lost.new
		@category = Category.all
	end

	
	def create
  		@lost = Lost.new(lost_params)
  	  @lost.user = current_user
  		
  		if @lost.save
  			flash[:notice] = "Reported was successfully created"
  			redirect_to losts_path, :notice => "Your post has be saved"
  		else
  			render "new"
  		end
     
  	end
	
	def show
		@lost = Lost.find(params[:id])
	end
    
    private 
    
    def lost_params
    	params.require(:lost).permit(:item_name,:item_desc, :category_id, :user_id)
    end

end
