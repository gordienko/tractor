class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy, :move]

  def index
    @pages = Page.all.order(position: :asc)
  end

  def new
    @page = Page.new
  end

  # GET /media/1/edit
  def edit
    #authorize @media
    puts @page.custom_fields # got a horrible feeling i need to put this to fix the form.  TODO: why?
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    #authorize @media
    respond_to do |format|
      if @page.update(page_params(@page.custom_fields_parameters))
        format.html { redirect_to edit_admin_page_path(@page), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit , status: :unprocessable_entity}
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end


    def create
      @page = Page.new(page_params)
      if @page.save
         redirect_to edit_admin_page_path(@page), notice: "Page was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
    end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_path, notice: 'Page deleted.' }
      format.json { head :no_content }
    end
  end

  def move
    @page.insert_at(params[:position].to_i)
    head :ok
  end

  def set_page
    @page = Page.friendly.find(params[:id])
  end

  def page_params(custom_content_items)
    puts "custom_content_items: #{custom_content_items}"
    params.require(:page).permit(:title, :content, :template, :keywords, :description, :content_two, :slug, custom_content: custom_content_items )
  end
end
