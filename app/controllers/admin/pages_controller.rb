class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
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

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title)
  end
end
