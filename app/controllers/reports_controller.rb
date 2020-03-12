class ReportsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @reports = @student.reports.includes(:user).order("created_at DESC")
  end

  def new
    @report = Report.new
    @student = Student.find(params[:student_id])
  end

  def create
    @student = Student.find(params[:student_id])
    @report = @student.reports.new(report_params)
    if @report.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
  
  end

  def update
  end

  def report_params
    params.require(:report).permit(
      :year,
      :month,
      :day,
      :unit,
      :homework_rate,
      :mini_test,
      :mini_test_rate,
      :content,
      :teacher,
      :confirmation,
      :homework,
      :next_class,
    ).merge(user_id: current_user.id)
  end
end
