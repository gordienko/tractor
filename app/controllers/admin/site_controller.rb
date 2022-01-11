class Admin::SiteController < AdminController
  def dash
    @site = Site.first
  end

  def settings
    @site = Site.first
  end

  def homepage
    @site = Site.first
  end

  def activity
    @site = Site.first
  end

  def site_params
    params.require(:page).permit(:live, :keywords, :description)
  end
end
