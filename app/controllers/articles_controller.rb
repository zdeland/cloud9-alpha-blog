class ArticlesController < ApplicationController
 
 def index 
  @articles = Article.all
 end 
 
 def new 
  @art = Article.new
 end 
 
 def edit
    @art = Article.find(params[:id])
 end
 
 def update
    @art = Article.find(params[:id])
    if @art.update(article_params)
      flash[:notice] = "Article was successfully updated!"
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
   
   if @art.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@art)
   else
      render 'new' # renders new template
   end 
 end
 
 def show
    @art = Article.find(params[:id])
 end
 
 def destroy
    @art = Article.find(params[:id])
    @art.destroy
    flash[:notice] = "Article was successfully destroyed!"
    redirect_to articles_path
 end
 
 private 
   def article_params
      params.require(:article).permit(:title,:description) 
   end
 
 
end