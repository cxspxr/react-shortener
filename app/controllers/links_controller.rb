class LinksController < ApplicationController
  def index
    @links = Link.all
    json_response(@links)
  end

  def store
    @link = Link.create!(link_params)
    json_response(@link, :created)
  end

  def link_params
    params.permit(:url, :shortened)
  end
end
