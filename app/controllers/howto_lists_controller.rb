class HowtoListsController < ApplicationController
  before_action :set_howto_list, only: [:show, :edit, :update, :destroy]

  # GET /howto_lists
  # GET /howto_lists.json
  def index
    @howto_lists = HowtoList.all
  end

  # GET /howto_lists/1
  # GET /howto_lists/1.json
  def show
    # @steps = Step.where(howto_list_id: @howto_list)
  end

  # GET /howto_lists/new
  def new
    @howto_list = HowtoList.new
  end

  # GET /howto_lists/1/edit
  def edit
  end

  # POST /howto_lists
  # POST /howto_lists.json
  def create
    @howto_list = HowtoList.new(howto_list_params)

    respond_to do |format|
      if @howto_list.save
        format.html { redirect_to @howto_list, notice: 'Howto list was successfully created.' }
        format.json { render :show, status: :created, location: @howto_list }
      else
        format.html { render :new }
        format.json { render json: @howto_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /howto_lists/1
  # PATCH/PUT /howto_lists/1.json
  def update
    respond_to do |format|
      if @howto_list.update(howto_list_params)
        format.html { redirect_to @howto_list, notice: 'Howto list was successfully updated.' }
        format.json { render :show, status: :ok, location: @howto_list }
      else
        format.html { render :edit }
        format.json { render json: @howto_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /howto_lists/1
  # DELETE /howto_lists/1.json
  def destroy
    @howto_list.destroy
    respond_to do |format|
      format.html { redirect_to howto_lists_url, notice: 'Howto list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_howto_list
      @howto_list = HowtoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def howto_list_params
      params.require(:howto_list).permit(:name, :author, :image_url, :materials)
    end
end
