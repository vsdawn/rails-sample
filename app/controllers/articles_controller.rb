class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :logged_in_user, only: [:new, :index, :edit, :show]
  
	def index
    @articles = Article.all
  end


	def show
    @article = Article.find(params[:id])
  end

	def new
    @article = Article.new
  end

  def edit
  @article = Article.find(params[:id])
end


def create
  @article = Article.new(article_params.merge(user_id: current_user.id))
  
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end


def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
 
private
  def article_params
    params.require(:article).permit(:text)
  end
  # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
