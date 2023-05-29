class Api::V1::ReviewsController < ApplicationController
  before_action :is_admin
  before_action :admin_only, only: %i[ approve ]
  before_action :set_review, only: %i[ show update destroy approve ]

  # GET /reviews
  def index
    @reviews = Review.approved(@is_admin).all
  end

  def approve
    @review.update_attribute(:approved, true)
    render json: {status: "ok", review: @review}, status: :ok
  end

  # GET /reviews/1
  def show
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /reviews/1
  # def update
  #   if @review.update(review_params)
  #     render json: @review
  #   else
  #     render json: @review.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /reviews/1
  # def destroy
  #   @review.destroy
  # end

  
  private
    def admin_only
      if !@is_admin
        not_found
      end
    end

    def is_admin
      @is_admin = request.headers["admin"] == "admin_rails"
    end

    def not_found
      render json: {status: "Not Found"}, status: :not_found
    end

    def set_review
      @review = Review.approved(@is_admin).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found
    end

    def review_params
      params.require(:review).permit(:id, :employee_id, :rating, :comment)
    end
end
