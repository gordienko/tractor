class Admin::UserformFieldsController < AdminController
  before_action :set_userform_field, only: [:show, :edit, :update, :destroy, :move]

  def set_userform_field
    @userform_field = UserformField.find(params[:id])
  end

  def create
    @userform = Userform.find(params[:userform_id])
    @userform_field = @userform.userform_fields.new(userform_field_params)
    if @userform_field.save
       redirect_to admin_userform_path(@userform_field.userform), notice: "Item created."
    else
       render template: 'admin/userforms/show', status: :unprocessable_entity
    end
  end

  def destroy
    @userform_field.destroy
    respond_to do |format|
      format.html { redirect_to admin_menu_path(@userform_field.userform), status: :see_other , notice: 'Item deleted.' }
      format.json { head :no_content }
    end
  end

  def move
    @userform_field.insert_at(params[:position].to_i)
    head :ok
  end

  def userform_field_params
    params.require(:userform_field).permit(:name, :hint, :field_type)
  end
end
