class PostingsController < ApplicationController
  before_filter :find_and_authorize_posting, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_posting, only: [:index, :new, :create]

  def index
    @postings = policy_scope(Posting)
  end

  def show
  end

  def new
  end

  def create
    @posting = current_user.postings.build(posting_params)
    if @posting.save!
      redirect_to @posting
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @posting.update(posting_params)
      redirect_to @posting
    else
      render :edit
    end
  end

  def destroy
    @posting.destroy
    redirect_to postings_path, success: 'Posting destroyed.'
  end

  private

  def posting_params
    params.require(:posting).permit(:quickname, :job_title, :job_url, :company, :company_url, :description, :requirements, :notes, :remote, :full_time, :priority, :status)
  end

  def find_and_authorize_posting
    @posting = current_user.postings.find params[:id]
    authorize @posting
  end

  def authorize_posting
    authorize Posting
  end

end
