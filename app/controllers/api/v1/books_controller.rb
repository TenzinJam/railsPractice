require 'net/http'

module Api
  module V1
    class BooksController < ApplicationController
      include ActionController::HttpAuthentication::Token

      MAX_PAGINATION_LIMIT = 100

      before_action :authenticate_user, only: [:create, :destroy]

      def index
        books = Book.limit(limit).offset(params[:offset])

        render json: BooksRepresenter.new(books).as_json
      end

      def create
        author = Author.create!(author_params)
        book = Book.new(book_params.merge(author_id: author.id))

        # uri = URI('http://localhost:4567/update_sku')
        # req = Net::HTTP::Post.new(url, 'Content-Type' => 'application.json')
        # req.body = { sku: '123', name: book_params[:name]}.to_json
        # res = Net::HTTP.start(uri.host, uri.port) do
        #   http.request(req)
        # end

        if book.save
          render json: BookRepresenter.new(book).as_json, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
      end

      private

      def authenticate_user
        # Authorization: Bearer <token>
        token, _options = token_and_options(request)
        # the underscore before the varibale name is to show that we don't really care about that value.
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
        rescue ActiveRecord::RecordNotFound
        render status: :unauthorized
      end


      def limit
        [
          params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
          MAX_PAGINATION_LIMIT
        ].min
      end


      def author_params
        params.require(:author).permit(:first_name, :last_name, :age)
      end

      def book_params
        params.require(:book).permit(:title)
      end

    end
  end
end
