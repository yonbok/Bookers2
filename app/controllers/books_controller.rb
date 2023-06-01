class BooksController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :destroy]


  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(books_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    end
  end

  def create
    @user = User.new(users_path)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book)
    else
      @book = Book.new(book_path)
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
    @book = Book.new
    @book = Book.find(params[:id])
    @user =  @book.user
    flash[:notice] = "You have created book successfully."
  end

  def edit
     @book = Book.find(params[:id])
     @user = @book.user
     if @book.user != current_user
      redirect_to books_path
     end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  # def is_matching_login_user
  #   @book = Book.find(params[:id])
  #   @user =  @book.user
  #     redirect_to book_path
  #   unless @user == current_user
  #   end
  # end

end

