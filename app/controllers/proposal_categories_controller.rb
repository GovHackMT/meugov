class ProposalCategoriesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  before_action :set_proposal_category, only: [:show, :edit, :update, :destroy]

  # GET /proposal_categories
  # GET /proposal_categories.json
  def index
    @proposal_categories = ProposalCategory.all
  end

  # GET /proposal_categories/1
  # GET /proposal_categories/1.json
  def show
  end

  # GET /proposal_categories/new
  def new
    @proposal_category = ProposalCategory.new
  end

  # GET /proposal_categories/1/edit
  def edit
  end

  # POST /proposal_categories
  # POST /proposal_categories.json
  def create
    @proposal_category = ProposalCategory.new(proposal_category_params)

    respond_to do |format|
      if @proposal_category.save
        format.html { redirect_to @proposal_category, notice: 'Proposal category was successfully created.' }
        format.json { render :show, status: :created, location: @proposal_category }
      else
        format.html { render :new }
        format.json { render json: @proposal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposal_categories/1
  # PATCH/PUT /proposal_categories/1.json
  def update
    respond_to do |format|
      if @proposal_category.update(proposal_category_params)
        format.html { redirect_to @proposal_category, notice: 'Proposal category was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal_category }
      else
        format.html { render :edit }
        format.json { render json: @proposal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_categories/1
  # DELETE /proposal_categories/1.json
  def destroy
    @proposal_category.destroy
    respond_to do |format|
      format.html { redirect_to proposal_categories_url, notice: 'Proposal category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_category
      @proposal_category = ProposalCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_category_params
      params.require(:proposal_category).permit(:name)
    end
end
