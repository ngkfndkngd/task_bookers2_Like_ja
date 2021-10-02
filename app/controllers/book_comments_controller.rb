class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    if @book_comment.save
      redirect_to book_path(@book.id)
    else
      render 'books/show'
    end
  end

  def destroy
    
  end
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
