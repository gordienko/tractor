class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # GET /media/1/edit
  def edit
    #authorize @media
  end

  # PATCH/PUT /media/1
# PATCH/PUT /media/1.json
def update
  #authorize @media
  respond_to do |format|

    if @user.update(user_params)
      format.html { redirect_to edit_admin_user_path(@user), notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

  def create
    def create
      @user = User.new(user_params)
      @user.password = Devise.friendly_token.first(8)
      if @user.save
         redirect_to admin_users_path, notice: "User was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @userform.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'UserForm deleted.' }
      format.json { head :no_content }
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :last_name, :role)
  end
end
