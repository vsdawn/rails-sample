class CommentsController < ApplicationController
	 # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroys
	 before_action :logged_in_user, only: [:comment]
def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to article_path(@article)
  end
   def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end