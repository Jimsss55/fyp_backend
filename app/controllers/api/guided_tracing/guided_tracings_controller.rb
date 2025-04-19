class Api::GuidedTracing::GuidedTracingsController < ApplicationController
  def index
    @guided_tracing = GuidedTracing.all
    render json: @guided_tracing
  end
end
