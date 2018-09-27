class LinksController < ApplicationController
  def index
    @links = Link.all
    json_response(@links)
  end

  def store
    @link = Link.create!(link_params)

    if @link.valid?
      json_response(@link, :created)
    end
  end

  def get
    @link = Link.where(url: link_params[:url])
    json_response(@link)
  end

  def count
    @count = Link.count
    json_response(@count)
  end

  def link_params
    params.permit(:url, :shortened)
  end
end
