class StepsController < ApplicationController
  before_action :find_howto_list
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @step = @howto_list.steps.new
  end

  def edit
  end

  def create
    @step = @howto_list.steps.new(step_params)
    respond_to do |format|
      if @step.save
        format.html { redirect_to howto_list_steps_path, notice: 'Step was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def url_options
    { howto_list_id: params[:howto_list_id] }.merge(super)
  end

  def update
    if @step.update_attributes(step_params)
      flash[:success] = "Saved step."
      redirect_to howto_list_steps_path
    else
      flash[:error] = "That step could not be saved."
      render action: :edit
    end
  end

  def destroy
    @step.destroy
    if @step.destroy
      flash[:success] = "Step was deleted."
    else
      flash[:error] = "Step could not be deleted."
    end
    redirect_to howto_list_steps_path
  end

  private

    def find_howto_list
      @howto_list = HowtoList.find(params[:howto_list_id])
    end

    def set_step
      @step = @howto_list.steps.find(params[:id])
    end

    def step_params
      params[:step].permit(:description)
    end
end
