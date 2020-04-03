class CommentsController < ApplicationController
  def create
    if (current_user.user_status_id == "2") && Comment.create(comment_params)
      redirect_to student_reports_path
    else
      redirect_to student_reports_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if (@comment.user_id == current_user.id) && @comment.destroy
      redirect_to student_reports_path
    else
      redirect_to student_reports_path
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(student_id: params[:student_id],report_id: params[:report_id],user_id: current_user.id)
  end
end
