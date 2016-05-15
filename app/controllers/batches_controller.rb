class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  def index
    @batches = Batch.all
  end

  def show
  end

  def new
    @batch = Batch.new
  end

  def edit
  end

  def create
    @batch = Batch.new(batch_params)
    respond_to do |format|
      if @batch.save
        format.js
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.js
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.js
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @batch.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def batch_section
    @batch = Batch.find(params[:batch_section][:batch_id])
    @section = Section.create(:course_id => @batch.course.try(:id), :batch_id => @batch.id, :name => params[:batch_section][:name])
  end

  private

    def set_batch
      @batch = Batch.find(params[:id])
    end

    def batch_params
      params.require(:batch).permit(:start_year, :end_year, :is_active, :course_id)
    end
end
