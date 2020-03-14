class CommentsController < ApplicationController
  def create
    if Comment.create(comment_params)
      redirect_to student_reports_path
    else
      render controller: :reports, action: :index
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(student_id: params[:student_id],report_id: params[:report_id],user_id: current_user.id)
  end
end
