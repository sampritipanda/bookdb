require 'open-uri'

class BooksController < ApplicationController

  # GET /books
  def index
    if request.post?
      @books = ISBNdb::Query.find(:collection => 'books', :where => { params[:type].to_sym => params[:value] })
    end
  end

  # GET /books/978-0-9776-1663-3
  def show
    @book = ISBNdb::Query.find_book_by_isbn(params[:isbn])[0]
    @image = Nokogiri::HTML(open(Nokogiri::HTML(open("http://www.isbndb.com/book/#{@book.book_id}")).css("#iframeamazon")[0].attributes["src"].value)).css("img")[0].attributes["src"].value
  end

end
