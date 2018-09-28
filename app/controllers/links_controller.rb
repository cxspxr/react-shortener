class LinksController < ApplicationController
  def index
    @links = Link.all
    json_response(@links)
  end

  def store
    @link = Link.create!(link_params)

    if @link.valid?
      @link.shortened = "#{request.base_url}/#{@link.shortened}"
      json_response(@link, :created)
    end
  end

  def get
    @link = Link.where(url: link_params[:url]).first

    if @link
      json_response({ shortened: "#{request.base_url}/#{@link.shortened}" })
    else
      json_response nil, :no_content
    end
  end

  def count
    @count = Link.count
    json_response(@count)
  end
  def link_params
    params.permit(:url, :shortened)
  end
end
