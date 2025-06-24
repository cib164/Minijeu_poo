require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Bienvenue dans mon jeu de combat !!!"
puts

# Entrée human_player
puts "Quel est ton prénom, jeune combattant ?"
print "> "
player_name = gets.chomp
human_player = HumanPlayer.new(player_name)

# Entrée joueurs ennemies
player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2] # array contenant les 2 player


# 1ere indication
puts "Voici l'état de nos joueurs :"
puts "#{player1.name} a #{player1.life_points} points de vie"
puts "#{player2.name} a #{player2.life_points} points de vie"
puts

# Combat
while Human_player.life_points > 0 && ennemies.life_points > 0
  puts "--------------------------------------"
  puts "Passons à la phase d'attaque :"
  puts

  player1.attacks(player2)
  break if player2.life_points <= 0
  puts

  player2.attacks(player1)
  puts

  # Affichage de l'état après chaque round
  puts "Voici l'état de nos joueurs :"
  puts "#{player1.name} a #{player1.life_points} points de vie"
  puts "#{player2.name} a #{player2.life_points} points de vie"
  puts
end

# Résultat du combat
puts "--------------------------------------"
puts
puts "Le combat est terminé !"
puts

if player1.life_points > 0
  puts "#{player1.name} a gagné le combat !"
else
  puts "#{player2.name} a gagné le combat !"
end

puts
binding.pry
