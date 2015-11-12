class HowtoListsController < ApplicationController
  before_action :set_howto_list, only: [:show, :edit, :update, :destroy]

  def index
    @howto_lists = HowtoList.all
  end

  def show
  end

  def new
    @howto_list = HowtoList.new
  end

  def edit
  end

  def create
    @howto_list = HowtoList.new(howto_list_params)
    if @howto_list.save
      flash[:success] = 'Howto list was successfully created.'
      redirect_to @howto_list
    else
      flash[:error] = "Howto list could not be saved"
      render :new
    end
  end

  def update
    if @howto_list.update(howto_list_params)
      flash[:success] = "Updated list."
      redirect_to @howto_list
    else
      flash[:error] = "List could not be saved."
      render action: :edit
    end
  end

  def destroy
    @howto_list.destroy
    respond_to do |format|
      format.html { redirect_to howto_lists_url, notice: 'Howto list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_howto_list
    @howto_list = HowtoList.find(params[:id])
  end

  def howto_list_params
    params.require(:howto_list).permit(:name, :author, :image_url, :materials)
  end
end
