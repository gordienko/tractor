class Admin::EmbedsController < AdminController
  def update
    embed = Embed.new(id: params[:content])
    # TODO:  make a propper embed model and replace to thumbnail
    content = ApplicationController.render(partial: 'embeds/embed',
                                           locals: { embed: embed },
                                           formats: :html)
    render json: { content: content, sgid: embed.attachable_sgid }
  end
end
