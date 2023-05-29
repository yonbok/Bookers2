class BooksController < ApplicationController
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(books_params)
    redirect_to book_path(@book.id)
    end
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Welcome! You have signed up successfully."
     redirect_to book_path(@book)
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user =  @book.user
  end

  # def destroy
  #   book = Book.find(params[:id])
  #   book.destroy
  #   redirect_to book
  # end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end

