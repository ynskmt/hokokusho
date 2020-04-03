class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :destroy]

  def new
    @student = Student.new
    redirect_to root_path unless current_user.user_status_id == "3"
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless @student.student_users[0].user_id == current_user.id
  end

  def update
    if @student.update(student_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if (@student.student_users[0].user_id == current_user.id) && @student.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :school_id, :grade_id, :subject_id, user_ids: [] )
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
