class ReportsController < ApplicationController
  before_action :set_student

  def index
    @reports = @student.reports.includes(:user).order("created_at DESC")
    @comment = Comment.new
  end

  def new
    @report = Report.new
    redirect_to root_path unless current_user.user_status_id == "3"
  end

  def create
    @report = @student.reports.new(report_params)
    if @report.save
      redirect_to student_reports_path(@student)
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
    redirect_to root_path unless @report.user_id == current_user.id
  end

  def update
    @report = @student.reports.find(params[:id])
    if @report.update(report_params)
      redirect_to student_reports_path(@student)
    else
      redirect_to student_reports_path(@student)
    end
  end

  def destroy
    @report = @student.reports.find(params[:id])
    if (@report.user_id == current_user.id) && @report.destroy
      redirect_to student_reports_path(@student)
    else
      redirect_to student_reports_path(@student)
    end
  end

  private
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

  def set_student
    @student = Student.find(params[:student_id])
  end
end
