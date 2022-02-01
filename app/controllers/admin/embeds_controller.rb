class Admin::EmbedsController < AdminController
  def update
    puts params
    @embed = Embed.find_or_create_by(url: params[:content])
    content = ApplicationController.render(partial: 'embeds/thumbnail',
                                           locals: { embed: @embed },
                                           formats: :html)
    render json: { content: content, sgid: @embed.attachable_sgid }

  end
end
