# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

csv_text = File.read("app/assets/movie_flops.csv")
flops = CSV.parse(csv_text, headers: false, encoding: "ISO-8859-1")

# flops.each do |row|
#     # puts row.to_hash
#     m = Movie.new
#     m.title = row[0]
#     m.year_released = row[1]
#     m.budget = row[2].index('-') ? row[2].slice(row[2].index('-')+1..row[2].size) : row[2].slice(row[2].index('$')+1..row[2].size)
#     m.box_office = row[3].slice(row[3].index('$')+1..row[3].size)
#     unless m.save
#         puts 'error'
#     end
# end

flops.each do |flop|
    if flop[2].to_s.index('-')
        # puts flop[2].index('-') + 1
        # puts flop[0]
        # puts flop[3].to_s.slice(flop[3].to_s.index('$')+1..flop[3].to_s.size)
        m = Movie.new(title: flop[0].to_s, year_released: flop[1].to_s, budget: flop[2].slice(flop[2].index('-')+1..flop[2].size), worldwide_gross: flop[3].to_s.slice(flop[3].to_s.index('$')+1..flop[3].to_s.size))
        m.save()
    elsif flop[2].to_s.index('$')
        # puts flop[0]
        # puts flop[3].to_s.slice(flop[3].to_s.index('$')+1..flop[3].to_s.size)
        # puts flop[2].to_s.index('$')+1
        m2 = Movie.new(title: flop[0].to_s, year_released: flop[1].to_s, budget: flop[2].to_s.slice(flop[2].to_s.index('$')+1..flop[2].to_s.size), worldwide_gross: flop[3].to_s.slice(flop[3].to_s.index('$')+1..flop[3].to_s.size))
        m2.save()
    end
    # Movie.create(title: flop[0], date_released: flop[1], budget: flop[2].to_s.slice(flop[2].to_s.index('-')+1..flop[2].to_s.size), box_office: flop[3])
end