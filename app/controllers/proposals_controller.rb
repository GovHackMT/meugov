class ProposalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_proposal, only: [:show, :edit, :update, :destroy, :vote]

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.all
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @comment = @proposal.comments.new
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: t('create_notice') }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: t('update_notice') }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: t('destroy_notice') }
      format.json { head :no_content }
    end
  end

  def vote
    @vote = @proposal.votes.new
    @vote.user = current_user
    @vote.answer = params[:answer]
    @vote.save!

    respond_to :js
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(
        :title, :content, :city_id, :street, :number, :complement,
        :neighborhood, :cep
      )
    end
end
