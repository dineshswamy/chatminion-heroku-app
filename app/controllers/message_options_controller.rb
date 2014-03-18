class MessageOptionsController < ApplicationController
  before_action :set_message_option, only: [:show, :edit, :update, :destroy]

  # GET /message_options
  # GET /message_options.json
  def index
    @message_options = MessageOption.all
  end

  # GET /message_options/1
  # GET /message_options/1.json
  def show
  end

  # GET /message_options/new
  def new
    @message_option = MessageOption.new
  end

  # GET /message_options/1/edit
  def edit
  end

  # POST /message_options
  # POST /message_options.json
  def create
    @message_option = MessageOption.new(message_option_params)

    respond_to do |format|
      if @message_option.save
        format.html { redirect_to @message_option, notice: 'Message option was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message_option }
      else
        format.html { render action: 'new' }
        format.json { render json: @message_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_options/1
  # PATCH/PUT /message_options/1.json
  def update
    respond_to do |format|
      if @message_option.update(message_option_params)
        format.html { redirect_to @message_option, notice: 'Message option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_options/1
  # DELETE /message_options/1.json
  def destroy
    @message_option.destroy
    respond_to do |format|
      format.html { redirect_to message_options_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_option
      @message_option = MessageOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_option_params
      params.require(:message_option).permit(:message_id, :options_id)
    end
end
