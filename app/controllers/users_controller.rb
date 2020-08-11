class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        find_user
    end

    def new
        @user = User.new
        # @ingredients = Ingredient.all
        # @allergy = Allergy.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            # @allergy = Allergy.create(allergy_params)
            # @user.ingredients << Ingredient.find(@allergy.ingredient_id)
            redirect_to user_name(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def destroy
        find_user
        @user.delete
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:name)
    end

    def allergy_params
        params.require(:allergy).permit(:user_id, :ingredient_id)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
