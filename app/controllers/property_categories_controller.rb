class PropertyCategoriesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  before_action :set_property_category, only: [:show, :edit, :update, :destroy]

  # GET /property_categories
  # GET /property_categories.json
  def index
    @property_categories = PropertyCategory.all
  end

  # GET /property_categories/1
  # GET /property_categories/1.json
  def show
  end

  # GET /property_categories/new
  def new
    @property_category = PropertyCategory.new
  end

  # GET /property_categories/1/edit
  def edit
  end

  # POST /property_categories
  # POST /property_categories.json
  def create
    @property_category = PropertyCategory.new(property_category_params)

    respond_to do |format|
      if @property_category.save
        format.html { redirect_to @property_category, notice: 'Property category was successfully created.' }
        format.json { render :show, status: :created, location: @property_category }
      else
        format.html { render :new }
        format.json { render json: @property_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_categories/1
  # PATCH/PUT /property_categories/1.json
  def update
    respond_to do |format|
      if @property_category.update(property_category_params)
        format.html { redirect_to @property_category, notice: 'Property category was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_category }
      else
        format.html { render :edit }
        format.json { render json: @property_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_categories/1
  # DELETE /property_categories/1.json
  def destroy
    @property_category.destroy
    respond_to do |format|
      format.html { redirect_to property_categories_url, notice: 'Property category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_category
      @property_category = PropertyCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_category_params
      params.require(:property_category).permit(:name)
    end
end
