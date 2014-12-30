class RatingsController < InheritedResources::Base

  def new
    @rating = Rating.new
    @rating.criterions.build
  end




  private

    def rating_params
      params.require(:rating).permit(:beer_id, :user_id, :comment, criterions_attributes:[:id,:rating_id, :name, :value])
    end
end

