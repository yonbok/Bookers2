class BooksController < ApplicationController
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(books_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    end
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book)
    else
      render :index
    end
  end

  def index
    # @book = Book.find(books_params) #parameter missing
    @book = Book.new
    @books = Book.all
     flash[:notice] = "Welcome! You have signed up successfully."
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user =  @book.user
  end

  def edit
     @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end

