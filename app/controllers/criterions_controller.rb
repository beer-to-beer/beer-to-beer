class CriterionsController < InheritedResources::Base

  private

    def criterion_params
      params.require(:criterion).permit(:rating_id, :name, :value)
    end
end

