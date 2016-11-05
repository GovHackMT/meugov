class ReportPropertiesCitiesController < ApplicationController
  def index
  end

  def result
    @cities = nil
    if params[:property_category_id].present?
      @cities =
    end
  end
end
