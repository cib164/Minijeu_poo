require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Création Human player
puts "Quel est ton prénom ?"
print ">"
user_name = gets.chomp
user = HumanPlayer.new(user_name)

# Entrée joueurs ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")
# Je stock mes ennemis
ennemis = [player1, player2]

puts user.show_state

# 1ere indication
puts "Voici l'état de nos joueurs :"
ennemis.each do |ennemi|
  puts "{ennemis.name} a #{ennemis.life_points}"
end


# Combat
while Human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "--------------------------------------"
  puts "Passons à la phase d'attaque :"
  puts

# On affiche les choix d’action du joueur
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "Attaquer un joueur en vue :"
  enemies.each_with_index do |ennemi, index| #etudie tout les éléméents de mon tableau ennemis
    if ennemis.life_points > 0
      puts "#{index} - #{ennemi.name} a #{ennemi.life_points} points de vie"
    end

    print "> "
  choix = gets.chomp

  # MENU
  if choix == "a"
    user.search_weapon
  elsif choix == "s"
    user.search_health_pack
  elsif choix == "0" && player1.life_points > 0
    user.attacks(player1)
  elsif choix == "1" && player2.life_points > 0
    user.attacks(player2)
  else
    puts "Action non valide ou cible morte"
  end


  # Phase d'attaque des ennemis
  puts "Les ennemis contre-attaquent !"
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end

  puts
  puts user.show_state
end

# Fin du jeu
puts "--------------------------------------"
puts "La partie est finie"

if user.life_points > 0
  puts "BRAVO ! TU AS GAGNÉ !"
else
  puts "Loser ! Tu as perdu !"
end


binding.pry
