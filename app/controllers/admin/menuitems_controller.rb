class Admin::MenuitemsController < AdminController
  before_action :set_menuitem, only: [:show, :edit, :update, :destroy, :move]

  def create
    @menu = Menu.find(params[:menu_id])
    @menuitem = @menu.menuitems.new(menuitems_params)
    if @menuitem.save
       redirect_to admin_menu_path(@menuitem.menu), notice: "Item created."
    else
       render :new, status: :unprocessable_entity
    end
  end

  def move
    @menuitem = Menuitem.find(params[:id])
    if params[:ancestry] == 'undefined'
      @menuitem.update_columns(ancestry:  nil)
    else
      @menuitem.update_columns(ancestry:  params[:ancestry])
    end
    @menuitem.insert_at(params[:position].to_i)
    head :ok
  end

  def destroy
    @menuitem.destroy
    respond_to do |format|
      format.html { redirect_to admin_menu_path(@menuitem.menu), status: :see_other , notice: 'Item deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_menuitem
    @menuitem = Menuitem.find(params[:id])
  end
  def menuitems_params
    params.require(:menuitem).permit(:name, :menu_id, :link, :menuitemable_id, menuitemable_type)
  end
end
