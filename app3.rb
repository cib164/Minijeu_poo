require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

# Message d’accueil
puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !    |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "-------------------------------------------------"
puts

# Initialisation du joueur
puts "Quel est ton prénom ?"
print "> "
user_name = gets.chomp

# Création de l'objet Game
my_game = Game.new(user_name)

# Boucle principale du jeu
while my_game.is_still_ongoing?
  puts
  my_game.show_players
  puts

  # Ajoute new joueur en vu
  my_game.new_players_in_sight  
  puts

  # Affichage du menu
  my_game.menu                  
  print "> "
  choix = gets.chomp
  puts

  my_game.menu_choix(choix)     # Traitement du choix
  puts

  my_game.enemies_attack if my_game.is_still_ongoing?  # Riposte des ennemis
end

# Fin du jeu
my_game.end

