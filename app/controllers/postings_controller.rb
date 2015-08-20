class PostingsController < ApplicationController

  def index
    @postings = policy_scope(Posting)
    authorize Posting
  end

  def show
    @posting = Posting.find params[:id]
    authorize @posting
  end

  def new
    authorize Posting
  end

  def create
    authorize Posting
  end

  def edit
    @posting = Posting.find params[:id]
    authorize @posting
  end

  def update
    @posting = Posting.find params[:id]
    authorize @posting
  end

  def destroy
    posting = Posting.find params[:id]
    authorize @posting
  end

  private

  def postings_params
    params.require(:posting).permit(:quickname, :job_title, :job_url, :company, :company_url, :description, :requirements, :notes, :remote, :full_time, :priority, :status)
  end

end
