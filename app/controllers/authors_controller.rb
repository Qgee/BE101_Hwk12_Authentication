class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    @author = Author.new
  end

  def show
    @author = Author.find_by_id(params[:id])
  end

  def create
    @author = Author.new(author_params)
    
    if @author.save
      flash[:notice] = "New author, #{@author.first_name} #{@author.last_name}, saved successfully"
    else
      flash[:alert] = "Error: Author save unsuccessful"
    end

    redirect_to(authors_path)
  end

  def edit
    @author = Author.find_by_id(params[:id])
  end

  def update
    @author = Author.find_by_id(params[:id])

    if @author.update_attributes(author_params)
      flash[:notice] = "Update successful."
      redirect_to author_path(@author)
    end
  end

  def destroy
    @author = Author.find_by_id(params[:id])
    author = @author.first_name + " " + @author.last_name
    if @author.delete
      flash[:notice] = "#{author} deleted successfully."
    end
    redirect_to authors_path
  end

  private

  def author_params
      params.require(:author).permit(:first_name,:last_name)
  end

end
