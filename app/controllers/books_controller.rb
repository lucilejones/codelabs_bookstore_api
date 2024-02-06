class BooksController < ApplicationController
    def index
        books = Book.all

        render json: books, status: :ok
    end

    def show
        book = Book.find(params[:id])

        render json: book, status: :ok
    end

    def create
        book = Book.new(book_params)

        if book.save
            render json: book, status: :created
        else
            render json: book.errors, status: :unprocessable_entity
        end
    end

    # request in postman:
    # {
    #     "title": "Any Way the Wind Blows",
    #     "author_id": 1
    # }

    def update
        book = Book.find(params[:id])

        if book.update(book_params)
            render json: book, status: :ok
        else
            render json: book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        book = Book.find(params[:id])

        if book.destroy
            render json: nil, status: :ok
        else
            render json: book.errors, status: :unprocessable_entity
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author_id)
    end
end
