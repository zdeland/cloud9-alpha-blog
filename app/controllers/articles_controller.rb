class ArticlesController < ApplicationController
 def new 
  @article = Article.new
 end 
 
 def create 
   #retrieve form filed values
   #render plain: params[:article].inspect 
   
   #must whitelist the params to create a new article
   @art = Article.new(article_params)
   @art.save
   redirect_to articles_show(@art)
 end
 
 private 
   def article_params
      params.require(:article).permit(:title,:description) 
   end
 
 
end