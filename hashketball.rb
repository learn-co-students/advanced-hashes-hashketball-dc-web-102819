def game_hash 
  teams = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, 
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1  
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        }, 
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5 
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 
        }
      }
    }
  }
end

##game_hash[:home][:players]["Alan Anderson"][:number] <-- reference

def num_points_scored(name)
  our_num = 0 
  game_hash.each do |home_away, about_teams|
  about_teams.each do |main_three, about|
      if main_three == :players
        about.each do |names, about_players|
        about_players.each do |stuff, the_sauce|
          if names == name and stuff == :points 
          our_num = the_sauce
        end
        end
      end
     end
  end
end
return our_num
end

def shoe_size(name)
  shoe_size = 0 
  game_hash.each do |home_away, about_teams|
  about_teams.each do |main_three, about|
      if main_three == :players
        about.each do |names, about_players|
        about_players.each do |stuff, the_sauce|
           if names == name and stuff == :shoe
             shoe_size = the_sauce
          end
        end
      end
     end
  end
end
return shoe_size
end

def team_colors(team_name) 
 answer = []
  if team_name == "Charlotte Hornets" 
    answer = game_hash[:away][:colors]
  end
  if team_name == "Brooklyn Nets"
    answer = game_hash[:home][:colors]
  end
  answer
end

def team_names  
  names = []
  names.push(game_hash[:home][:team_name])
  names.push(game_hash[:away][:team_name])
  names
end

def player_numbers(team_name)
  home_player_numbers = []
  away_player_numbers = []
  game_hash[:home].each do |a, b|
    if a == :players 
      b.each do |o, k|
        k.each do |thing, number|
          if thing == :number
            home_player_numbers.push(number)
          end
        end
      end
     end
  end 
  game_hash[:away].each do |a, b|
    if a == :players 
      b.each do |o, k|
        k.each do |thing, number|
          if thing == :number
            away_player_numbers.push(number)
          end
        end
      end
     end
  end
  if team_name == "Brooklyn Nets"
    return home_player_numbers
    elsif team_name == "Charlotte Hornets"
    return away_player_numbers
  end
end

def player_stats(player_name)
  return_this = ""
    game_hash.each do |home_away, about_teams|
     about_teams.each do |main_three, about|
       if main_three == :players
         about.each do |names, about_players|
         about_players.each do |stuff, the_sauce|
           if player_name == names
             return_this = about_players
           end
       end
       end
    end
  end
 end
 return_this
end

def big_shoe_rebounds 
  biggest_shoe = 0 
  biggest_shoe = game_hash[:home][:players]["Mason Plumlee"][:rebounds] 
  biggest_shoe
end
