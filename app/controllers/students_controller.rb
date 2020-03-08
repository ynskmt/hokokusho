class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :school_id, :grade_id, :subject_id, user_ids: [] )
  end
end
