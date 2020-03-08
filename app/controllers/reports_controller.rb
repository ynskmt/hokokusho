class ReportsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
  end

  def new
  end

  def create
  end
end
