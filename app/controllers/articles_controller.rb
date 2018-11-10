class ArticlesController < ApplicationController
 before_action :set_article, only: [:edit,:update,:show,:destroy]
 
 def index 
  @articles = Article.all
 end 
 
 def new 
  @art = Article.new
 end 
 
 def edit

 end
 
 def update
    if @art.update(article_params)
      flash[:success] = "Article was successfully updated!"
      redirect_to article_path(@art)
   else
      render 'edit' # renders edit template
   end
 end
 
 def create 
   #retrieve form filed values
   #render plain: params[:article].inspect 
   #must whitelist the params to create a new article
   @art = Article.new(article_params)
   
   #hard coding a user until authentication is added
   @art.user = User.first
   
   if @art.save
      flash[:success] = "Article was successfully created!"
      redirect_to article_path(@art)
   else
      render 'new' # renders new template
   end 
 end
 
 def show
    
 end
 
 def destroy
    @art.destroy
    flash[:danger] = "Article was successfully destroyed!"
    redirect_to articles_path
 end
 
 private 
   def set_article
      @art = Article.find(params[:id])
   end
   def article_params
      params.require(:article).permit(:title,:description) 
   end
 
 
end