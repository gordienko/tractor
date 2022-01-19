class Admin::UserformsController < AdminController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @userforms = Userform.all
  end

  def new
    @userform = Userform.new
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
      if @userform.update(userform_params)
        format.html { redirect_to edit_admin_userform_path(@userform), notice: 'UserForm was successfully updated.' }
        format.json { render :show, status: :ok, location: @userform }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userform.errors, status: :unprocessable_entity }
      end
    end
  end


    def create
      @userform = Userform.new(userform_params)
      if @userform.save
         redirect_to admin_userforms_path, notice: "Userform was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
    end


  def destroy
    @userform.destroy
    respond_to do |format|
      format.html { redirect_to admin_userforms_path, notice: 'UserForm deleted.' }
      format.json { head :no_content }
    end
  end

  def set_item
    @userform = Userform.find(params[:id])
  end

  def userform_params
    params.require(:userform).permit(:name, :user_notification, :admin_notification)
  end
end
