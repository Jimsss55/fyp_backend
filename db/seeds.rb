# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

achievements = [
  { name: "First Achievement", description: "Completed your first tracing", criteria: "First Tracing" },
  { name: "Second Achievement", description: "Submit 10 feedbacks", criteria: "Feedback Master" },
  { name: "Third Achievement", description: "Completed Alphabet Category", criteria: "Alphabet Master" }
]

achievements.each do |achievement|
  Achievement.find_or_create_by(achievement)
end

avatar_borders = [
  { name: "Dragon", cost: 30 },
  { name: "Cosmo", cost: 20 },
  { name: "Simple", cost: 10 },
  { name: "Platinum", cost: 15 },
  { name: "Ace", cost: 20 }
]

avatar_borders.each do |avatar|
  AvatarBorder.find_or_create_by(avatar)
end

guided_categories = [
  { name: "Alphabet", tracings: %w[ka Kha Ga Nga Cha] },
  { name: "Vowels", tracings:  %w[Geku Zhapchu ] }
]

guided_categories.each do |category_data|
  category = GuidedCategory.find_or_create_by(name: category_data[:name])

  category_data[:tracings].each do |letter_name|
    GuidedTracing.find_or_create_by(name: letter_name, guided_category: category)
  end
end

