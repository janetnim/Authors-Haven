class ArticleController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if(@article.save)
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article
      @article.update(article_params)
      @article.save
      redirect_to @article
    else
      render 'index'
    end
  end

  def delete
    @article = Article.find(params[:id])
    if @article
      @article.destroy
      redirect_to @articles
    else
      render 'index'

  private
  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
