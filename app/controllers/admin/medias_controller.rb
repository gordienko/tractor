class Admin::MediasController < AdminController
    before_action :set_media, only: [:show, :edit, :update, :destroy]
  def index
    # @media = Media.all
    @q = Media.ransack(params[:q])

    @medias = @q.result(distinct: true).order(id: :asc)
    # @medias = @medias.where(provider_id: current_user.provider_id)
    @pagy, @medias = pagy(@medias, items: 10)
    #authorize @medias

    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /media/1
  # GET /media/1.json
  def show
    #authorize @media
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /media/new
  def new
    @media = Media.new

    #authorize @media
  end

  # GET /media/1/edit
  def edit
    #authorize @media
  end

  # POST /media
  # POST /media.json
  def create
    @media = Media.new(media_params)

    respond_to do |format|
      if @media.save
        format.html { redirect_to admin_medias_path, notice: "Media was successfully created." }
        format.json { render :show, status: :created, location: @media }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    #authorize @media
    respond_to do |format|
      @media.destroy_attachment('file', media_params)
      if @media.update(media_params)
        format.html { redirect_to edit_admin_media_path(@media), notice: 'Media was successfully updated.' }
        format.json { render :show, status: :ok, location: @media }
      else
        format.html { render :edit }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @media.destroy
    respond_to do |format|
      format.html { redirect_to back_path, notice: 'Media deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def back_path
      if URI(request.referer).path == '/dash'
        '/dash'
      else
        medias_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_media
      @media = Media.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_params
      params.require(:media).permit(:name,  :file, :file_destroy)
    end
end
