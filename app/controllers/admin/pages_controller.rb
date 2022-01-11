class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
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

    if @page.update(page_params)
      format.html { redirect_to edit_admin_page_path(@page), notice: 'Page was successfully updated.' }
      format.json { render :show, status: :ok, location: @page }
    else
      format.html { render :edit }
      format.json { render json: @page.errors, status: :unprocessable_entity }
    end
  end
end

  def create
    def create
      @page = Page.new(page_params)
      if @page.save
         redirect_to admin_pages_path, notice: "Page was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @userform.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_path, notice: 'UserForm deleted.' }
      format.json { head :no_content }
    end
  end

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title)
  end
end