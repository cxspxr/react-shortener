class RedirectController < ApplicationController

  def redirect
    @link = Link.where(shortened: params[:shortened]).first

    if @link
      user_location = "#{request.location.country}, #{request.location.city}, #{request.location.address}"
      redirect = Redirect.new( location: user_location, time: Time.now )
      @link.redirects << redirect
      redirect_to @link.url
    else
      json_response({ error: 'bad link' }, :unprocessable_entity)
    end
  end

end
