require_relative "library.rb"

lib = Library.new
lib.generate_data


lib.active_reader
lib.popular_book
lib.readers_one_of_the_three_most_popular_books
lib.save_data
lib.load_data
