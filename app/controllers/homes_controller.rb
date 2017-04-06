class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:index, :new]

  def index
    if params[:inquire] == nil
      @homes = Home.all
    else
      @homes = User.find(params[:inquire]).homes
    end
  end

  def show
    @homes = User.find(current_user.id).homes
  end

  def new
    @home = Home.new
  end


  def edit

  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)
    respond_to do |format|
      if @home.save
        @appointment = Appointment.new
        @appointment.home_id = @home.id
        @appointment.user_id = current_user.id
        @appointment.save
        format.html { redirect_to @home, notice: '班级创建成功' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        @home.users << User.find_by_id(@home.append)
        format.html { redirect_to @home, notice: '班级更新成功' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: '班级删除成功' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_home
    @home = Home.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def home_params
    params.require(:home).permit(:name, :append)
  end
end
