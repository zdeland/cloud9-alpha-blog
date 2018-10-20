class ArticlesController < ApplicationController
 def new 
  @art = Article.new
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
 
 private 
   def article_params
      params.require(:article).permit(:title,:description) 
   end
 
 
end