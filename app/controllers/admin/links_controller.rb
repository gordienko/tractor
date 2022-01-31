class Admin::LinksController < AdminController
  def search
    @q = Page.ransack(params[:q])
    @links = @q.result(distinct: true).order(id: :asc)
    @count = @q.result(distinct: true).count
    content = ApplicationController.render(template: 'admin/links/search',
                                           layout: false,
                                           locals: { links: @links },
                                           formats: :html)
    render json: { content: content, count: @count  }
    # render layout: false
  end

  def attachment
    link = Page.find(params[:id])
    content = ApplicationController.render(partial: 'links/link',
                                           locals: { page: link, text: params[:text] },
                                           formats: :html)
    render json: { content: content, sgid: link.attachable_sgid }
  end
end
