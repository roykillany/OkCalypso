class Api::DetailsController < ApplicationController
  def index
    @details = Detail.all
    render json: @details
  end

  def create
  end

  def update
  end

  def detail_params
    params.require(:details).permit(:user_id, :orientation, :ethnicity, :height, :body_type, :diet, :smokes, :drinks, :drugs, :religion, :sign, :education, :job, :income, :relationship_status, :relationship_type, :offspring, :pets, :languages)
  end
end
