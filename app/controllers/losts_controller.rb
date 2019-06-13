class LostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    
	def index
    if params[:category].blank?
	   @losts = Lost.all.order("created_at DESC")
    else
      @category_id =Category.find_by(name: params[:category]).id
      @losts = Lost.where(:category_id => @category_id).order("created_at DESC")
    end
  
  end

	def new
		@lost = current_user.losts.build
		@category = Category.all.map { |c| [c.name, c.id] }
	end

	
	def create
  		@lost = current_user.losts.build(lost_params)
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
