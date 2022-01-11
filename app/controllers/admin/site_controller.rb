class Admin::SiteController < AdminController
  before_action :set_site
  def dash

  end

  def settings

  end

  def homepage

  end

  def activity

  end

  def help

  end

  def update
      if @site.update(site_params)
        if params['site']['page'] == 'homepage'
          redirect_to admin_homepage_path(@page), notice: 'Settings updated.'
        else
          redirect_to admin_settings_path(@page), notice: 'Settings updated.'
        end
      else
        render :edit
      end
  end

  def set_site
    @site = Site.first
  end

  def site_params
    params.require(:site).permit(:live, :keywords, :description)
  end
end
