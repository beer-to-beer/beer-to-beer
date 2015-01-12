class RatingsController < InheritedResources::Base


  def index
    @ratings1 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'avgprice' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Price"}).group("beers.id,criterions.name")
    @ratings2 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'avgtaste' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Taste"}).group("beers.id,criterions.name")
    @ratings3 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'avgheadache' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Headache"}).group("beers.id,criterions.name")
    @ratings4 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'overall' ").joins(:beer).joins(:criterions).group("beers.id")
    @ratings5 = @ratings4

    case params[:order]
      when "Price" then @ratings1 = @ratings1.order('avgprice DESC')
                        @ratings5 = @ratings1
      when "Taste" then @ratings2 = @ratings2.order('avgtaste DESC')
                        @ratings5 = @ratings2
      when "Headache" then @ratings3 = @ratings3.order('avgheadache DESC')
                           @ratings5 = @ratings3
      when "Overall" then @ratings4 = @ratings4.order('overall DESC')
                          @ratings5 = @ratings4
    end

    @ratings = Rating.joins(:beer).all.order("title")
  end


  def new
    @rating = Rating.new
    @rating.criterions.build
    @rating.criterions.build
    @rating.criterions.build
  end



  private

    def rating_params
      params.require(:rating).permit(:beer_id, :user_id, :comment, criterions_attributes:[:id,:rating_id, :name, :value])
    end
end