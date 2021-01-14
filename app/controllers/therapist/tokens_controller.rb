class Therapist::TokensController < ApiController
  before_action :require_physio

  def create
    @physio = find_physio
    token = encode_token(physio: @physio.id)
    render json: token
  end
end
