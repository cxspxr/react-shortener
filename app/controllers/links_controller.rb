class LinksController < ApplicationController
  def index
    @links = Link.all
    json_response(@links)
  end
end
