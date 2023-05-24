class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @books = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Welcome! You have signed up successfully."
     redirect_to books
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  # def show
  #   @book = Book.find(params[:id])
  # end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end

