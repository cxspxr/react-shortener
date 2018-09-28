class RedirectController < ApplicationController

  def redirect
    @link = Link.where(shortened: params[:shortened]).first

    if @link
      redirect_to @link.url
    else
      json_response({ error: 'bad link' }, :unprocessable_entity)
    end
  end

end
