class AuthorsController < ApplicationController
    def index
        authors = Author.all

        render json: authors, status: :ok
    end

    def show
        author = Author.find(params[:id])

        render json: author, status: :ok
    end

    def create
        author = Author.new(author_params)

        if author.save
            render json: author, status: :created
        else
            render json: author.errors, status: :unprocessable_entity
        end

    end
    
    def update
        author = Author.find(params[:id])

        if author.update(author_params)
            render json: user, status: :ok
        else
            render json: author.errors, status: :unprocessable_entity
        end
    end

    def destroy
        author = Author.find(params[:id])

        if author.destroy
            render json: nil, status: :ok
        else
            render json: author.errors, status: :unprocessable_entity
        end
    end

    def books_index
        author = Author.find(params[:author_id])
        author_books = author.books
    
        render json: author_books, status: :ok
    end

    private

    def author_params
        params.require(:author).permit(:first_name, :last_name)
    end
end
