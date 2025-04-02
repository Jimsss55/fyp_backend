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
  { name: "First Tracing", description: "Completed your first tracing" },
  { name: "Second Tracing", description: "Completed your second tracing" },
  { name: "Third Tracing", description: "Completed your third tracing" }
]

achievements.each do |achievement|
  Achievement.find_or_create_by(achievement)
end

avatar_borders = [
  { name: "Dragon", cost: 30 },
  { name: "Cosmo", cost: 20 },
  { name: "Simple", cost: 10 }
]

avatar_borders.each do |avatar|
  AvatarBorder.find_or_create_by(avatar)
end
