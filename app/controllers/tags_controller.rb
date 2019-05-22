class TagsController < ApplicationController
    before_action :authenticate_user!

    def index
  
      if current_user
        @tags = Tag.where(user_id: current_user.id)
      end
    end
  
    def edit
  
      @button_text = "Update"
      @tag = Tag.find(params[:id])
  
    end
  
    def update
  
      @tag = Tag.find(params[:id])
  
      if @tag.update_attributes(tag_params)
        redirect_to action: 'index'
      else
        render 'edit'
      end
  
    end
  
    def new
  
      @button_text = "Create"
      @tag = Tag.new
  
    end
  
    def create
  
      @tag = Tag.new(tag_params)
  
      if current_user
        @tag.user_id = current_user.id
      else
        render 'new'
      end
  
      if @tag.save
        redirect_to action: 'index'
      else
        render 'new'
      end
  
    end
  
    def destroy
  
      @tag = Tag.find(params[:id])
      @tag.destroy
  
      flash[:success] = "Tag deleted!"
    
      redirect_to tags_path
  
    end
  
    private
  
      def tag_params
        params.require(:tag).permit(:title, :description, :ammount,
                                        :tag_date, :currency)
      end
  end
  
