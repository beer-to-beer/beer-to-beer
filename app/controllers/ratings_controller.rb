class RatingsController < InheritedResources::Base


  def index
  if Rails.env.development?
    if (params[:type] == "avg")
      @ratings1 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'avgprice' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Price"}).group("beers.id,criterions.name")
      @ratings2 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'avgtaste' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Taste"}).group("beers.id,criterions.name")
      @ratings3 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'avgheadache' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Headache"}).group("beers.id,criterions.name")
      @ratings4 = Rating.select("*,(Round(sum(value)/count(value),1)) as 'overall' ").joins(:beer).joins(:criterions).group("beers.id")
      @ratings5 = @ratings4


    else
      @ratings1 = Rating.select("*,value as 'avgprice' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Price"}).group("ratings.id")
      @ratings2 = Rating.select("*,value as 'avgtaste' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Taste"}).group("ratings.id")
      @ratings3 = Rating.select("*,value as 'avgheadache' ").joins(:beer).joins(:criterions).where(:criterions => {name: "Headache"}).group("ratings.id")
      @ratings4 = Rating.select("*,(Round(sum(value)/3,1)) as 'overall' ").joins(:criterions).joins(:beer).group("ratings.id")
      @ratings5 = @ratings4

    end


  else


    if (params[:type] == "avg")
    @ratings1 = Rating.select("beers.id,beers.id as beer_id,(Round(sum(value)::numeric/count(value)::numeric,1)) as avgprice ").joins(:beer).joins(:criterions).where(:criterions => {name: "Price"}).group("beers.id,criterions.name")
    @ratings2 = Rating.select("beers.id,beers.id as beer_id,(Round(sum(value)::numeric/count(value)::numeric,1)) avgtaste ").joins(:beer).joins(:criterions).where(:criterions => {name: "Taste"}).group("beers.id,criterions.name")
    @ratings3 = Rating.select("beers.id,beers.id as beer_id,(Round(sum(value)::numeric/count(value)::numeric,1)) avgheadache ").joins(:beer).joins(:criterions).where(:criterions => {name: "Headache"}).group("beers.id,criterions.name")
    @ratings4 = Rating.select("beers.id,beers.id as beer_id,(Round(sum(value)::numeric/count(value)::numeric,1)) as overall ").joins(:beer).joins(:criterions).group("beers.id")
    @ratings5 = @ratings4


    else
      @ratings1 = Rating.select("ratings.id,headline,comment,ratings.id as rating_id,beer_id,user_id,value as avgprice ").joins(:beer).joins(:criterions).where(:criterions => {name: "Price"}).group("ratings.id,criterions.value")
      @ratings2 = Rating.select("ratings.id,headline,comment,ratings.id as rating_id,beer_id,user_id,value as avgtaste ").joins(:beer).joins(:criterions).where(:criterions => {name: "Taste"}).group("ratings.id,criterions.value")
      @ratings3 = Rating.select("ratings.id,headline,comment,ratings.id as rating_id,beer_id,user_id,value as avgheadache ").joins(:beer).joins(:criterions).where(:criterions => {name: "Headache"}).group("ratings.id,criterions.value")
      @ratings4 = Rating.select("ratings.id,headline,comment,ratings.id as rating_id,beer_id,user_id,(Round(sum(value)::numeric/3,1)) AS overall ").joins(:criterions).joins(:beer).group("ratings.id")
      @ratings5 = @ratings4

    end

  end

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
  end


  def new
    @rating = Rating.new
    @rating.criterions.build
    @rating.criterions.build
    @rating.criterions.build
  end



  private

    def rating_params
      params.require(:rating).permit(:beer_id, :user_id,:headline, :comment, criterions_attributes:[:id,:rating_id, :name, :value])
    end
end