require 'yaml'
require_relative "addbook.rb"

class Library
  include DataLib
  attr_accessor :books, :orders, :readers, :authors

  def initialize (books = [], orders = [], readers = [], authors = [])
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def active_reader
    hash = @orders.inject(Hash.new(0)) do |count, order|
      count[order.reader.name] += 1
      count
    end
    top_reader = hash.max_by { |key, value| value }.first
    puts "\nMost active reader: #{top_reader}"
  end

  def popular_book
    hash_with_books_count!
    top_book = @hash.max_by { |key, value| value }.first
    puts "Most popular book: #{top_book}"
    puts "\n"
  end

  def readers_one_of_the_three_most_popular_books
    books = {}
    hash_with_books_count!
    @hash.max_by { |key, value| books[key] = value }
    3.times { |i| puts "#{i+1}. Popular book: #{books.keys[i]}, have #{books.values[i]} reader(s);"}
    puts "\n"
  end

  def save_data(file_name = 'data.yaml')
    File.open(file_name, 'w') { |file| file.write(self.to_yaml) }
    print "File was written. success\n"
  end

  def load_data(file_name = 'data.yaml')
    lib = YAML.load(File.open(file_name))
    @books = lib.books
    @orders = lib.orders
    @readers = lib.readers
    @authors = lib.authors
    print "File was loaded. success\n"
  end

  private
    def hash_with_books_count!
      @hash = @orders.inject(Hash.new(0)) do |count, order|
        count[order.book.title] += 1
        count
      end
    end
end
