class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path, notice: 'User was successfully saved.'
        else
            render :new, status: :unprocessable_entity
        end
     
    end
    
    def edit
       @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        respond_to do |format|
            if @user.update(user_params)
              format.html { redirect_to root_path, notice: 'User was successfully saved.' }
            else
              format.html { render :edit, status: :unprocessable_entity}
            end
          end
    end

    private
        def user_params
            params.require(:user).permit(:username,:email,:password)
        end
end
