def run_game
  puts 'A Bandit Attacks!'
  loop do
    player_move
    sleep 1
    enemy_move
    sleep 1
  end
end

PLAYER_ACTIONS = {
  'attack' => -> { puts 'You slash for 8 damage!' },
  'spell' => -> { take_action("Which spell?", SPELL_ACTIONS) },
  'item' => -> { take_action("Which Item?", ITEMS) },
  'flee' => -> do
    puts "You live to fight another day 🐓"  
    exit
  end
}

SPELL_ACTIONS = {
  'fireball' => -> { puts 'You incinerate the foe for 15 damage!' },
  'heal' => -> { puts 'You restore 12 HP!' },
  'thundaga' => -> { puts 'You blast the foe for 19 damage!' }
}

ITEMS = {    
  'ration' => -> { puts 'You restore 5 HP!' },
  'scroll of truesight' => -> { puts 'You see everything! Accuracy +2!' },
  'potion' => -> { puts 'You restore 10 Mana!' }
}

def player_move
  take_action("What do you do?", PLAYER_ACTIONS)
  puts
end

def take_action(prompt, list)
  action = nil
  while action.nil? do
    puts
    puts prompt
    list.keys.each { |item| puts "--#{item.capitalize}"}
    item = gets.chomp.downcase
    action = list[item]
    unless action
      puts "You can't do that right now!"
    end
  end
  action.call
end

ENEMY_ACTIONS = {
  "attack" => -> { puts "The Bandit slashes for 5 damage!" },
  "buff" => -> { puts "The Bandit threatens you! Attack +2!" },
  "heal" => -> { puts "The Bandit drinks a potion and recovers 5 HP!" }
}

def enemy_move
  action = ENEMY_ACTIONS.keys.sample
  ENEMY_ACTIONS[action].call
end

run_game
