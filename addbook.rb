require 'faker'
require_relative "book.rb"
require_relative "order.rb"
require_relative "reader.rb"
require_relative "author.rb"

module DataLib
  def generate_data
    70.times { @authors << Author.new(Faker::Book.author, 'biography') }
    100.times do
      @readers << Reader.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        city: Faker::Address.city,
        street: Faker::Address.street_name,
        house: Faker::Address.building_number
      )
    end
    80.times { @books << Book.new(Faker::Book.title, @authors.sample) }
    200.times { @orders << Order.new(@books.sample, @readers.sample) }
  end
end
