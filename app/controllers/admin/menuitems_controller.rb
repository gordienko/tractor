class Admin::MenuitemsController < AdminController
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
  private
  def menuitems_params
    params.require(:menuitem).permit(:name, :menu_id)
  end
end
