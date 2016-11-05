class ReportPropertiesCitiesController < ApplicationController
  def index
  end

  def result
    @cities = nil
    if params[:property_category_id].present?
      @cities = City.report_properties params[:property_category_id]
    end
  end
end
