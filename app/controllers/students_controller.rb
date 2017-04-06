class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    # byebug
    @students = Home.find(params[:query]).students
  end

  # GET /students/1
  # GET /students/1.json
  def show

  end

  # GET /students/new
  def new
    @student = Student.new
    @student.home_id = params[:home_id]
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: '学生创建成功' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update

    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: '学生更新成功' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      # redirect_to students_url 这个是删除以后刷新当前界面，因为学生index中的参数是从班级名称点击过来的（携带参数），
      # 所以这样写会出错，应该写成 back 这样就重新走index这个方法
      format.html { redirect_to :back, notice: '学生删除成功' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :home_id)

  end


end
