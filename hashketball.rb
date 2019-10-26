require "pry"

def game_hash 

  game_hash = { home: 
                  {
                    team_name: "Brooklyn Nets",
                    colors:  ["Black", "White" ],
                    players: [
                       {
                        :player_name  => "Alan Anderson" ,
                        :number  => 0,
                        :shoe  => 16 ,
                        :points  => 22,
                        :rebounds  => 12,
                        :assists  => 12,
                        :steals  => 3,
                        :blocks  => 1,
                        :slam_dunks  => 1
                        },   {
                        
                        :player_name => "Reggie Evans" ,
                        :number => 30,
                        :shoe => 14 ,
                        :points => 12,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 12,
                        :blocks => 12,
                        :slam_dunks => 7
                        },    {
                        
                        :player_name => "Brook Lopez" ,
                        :number => 11,
                        :shoe => 17 ,
                        :points => 17,
                        :rebounds => 19,
                        :assists => 10,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 15
                        },  {
                        
                        :player_name => "Mason Plumlee" ,
                        :number => 1,
                        :shoe => 19 ,
                        :points => 26,
                        :rebounds => 11,
                        :assists => 6,
                        :steals => 3,
                        :blocks => 8,
                        :slam_dunks => 5
                        }, {
                        
                        :player_name => "Jason Terry" ,
                        :number => 31,
                        :shoe => 15 ,
                        :points => 19,
                        :rebounds => 2,
                        :assists => 2,
                        :steals => 4,
                        :blocks => 11,
                        :slam_dunks => 1
                        }
                      ]
                  
                  }, 
                  away: 
                  {
                    team_name: "Charlotte Hornets",
                    :colors => [ "Turquoise" , "Purple"  ],
                    players: [
                          {
                          :player_name => "Jeff Adrien" ,
                          :number => 4,
                          :shoe =>18 ,
                          :points => 10,
                          :rebounds => 1,
                          :assists => 1,
                          :steals => 2,
                          :blocks => 7,
                          :slam_dunks => 2
                          },   {
                          
                          :player_name => "Bismack Biyombo" ,
                          :number => 0,
                          :shoe => 16 ,
                          :points => 12,
                          :rebounds => 4,
                          :assists => 7,
                          :steals => 22,
                          :blocks => 15,
                          :slam_dunks => 10
                          },   {
                          
                          :player_name => "DeSagna Diop" ,
                          :number => 2,
                          :shoe => 14 ,
                          :points => 24,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 4,
                          :blocks => 5,
                          :slam_dunks => 5
                          },   {
                          
                          :player_name => "Ben Gordon" ,
                          :number => 8,
                          :shoe => 15 ,
                          :points => 33,
                          :rebounds => 3,
                          :assists => 2,
                          :steals => 1,
                          :blocks => 1,
                          :slam_dunks => 0
                          },    {
                            
                          :player_name => "Kemba Walker" ,
                          :number => 33,
                          :shoe => 15 ,
                          :points => 6,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 7,
                          :blocks => 5,
                          :slam_dunks => 12
                          }
                        ]
                  } 
      
                }

end

def all_players
 game_hash[:home][:players].concat(game_hash[:away][:players])
end
  
 
 def big_shoe_rebounds
   i = 0
  size = 0
  
  while i < game_hash[:home][:players].length do
    if game_hash[:home][:players][i][:shoe] > game_hash[:home][:players][size][:shoe]
      size = i
    end
    i += 1
  end
  p game_hash[:home][:players][size][:rebounds]
  return game_hash[:home][:players][size][:rebounds]
 end
  big_shoe_rebounds
  
  
   def most_points_scored
  i = 0
  points1 = 0
  points2 = 0
  while i < game_hash[:home][:players].length do
    if game_hash[:home][:players][i][:points] > game_hash[:home][:players][points1][:points]
      points1 = i
    end
    i += 1
  end
  i = 0
  while i < game_hash[:away][:players].length do
    if game_hash[:away][:players][i][:points] > game_hash[:away][:players][points2][:points]
      points2 = i
    end
    i += 1
  end
  if game_hash[:home][:players][points1][:points] > game_hash[:away][:players][points2][:points]
    return game_hash[:home][:players][points1][:player_name] 
  else
    return game_hash[:away][:players][points2][:player_name] 
  end
end


 
def team_names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]  ]
  
  return  teams
  
end
  team_names



 
 def player_with_longest_name
  i = 0
  long1 = 0
  long2 = 0
  while i < game_hash[:home][:players].length do
    if game_hash[:home][:players][i][:player_name].length > game_hash[:home][:players][long1][:player_name].length
      long1 = i
    end
    i += 1
  end
  i = 0
  while i < game_hash[:away][:players].length do
    if game_hash[:away][:players][i][:player_name].length > game_hash[:away][:players][long2][:player_name].length
      long2 = i
    end
    i += 1
  end
  if game_hash[:home][:players][long1][:player_name].length > game_hash[:away][:players][long2][:player_name].length
    return game_hash[:home][:players][long1][:player_name] 
  else
    return game_hash[:away][:players][long2][:player_name] 
  end
end



  
def team_colors(team_name)
  
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    
     end  
  end
end

  
 def winning_team
  h_score = 0
  a_score = 0 
  i = 0
  
  while i < game_hash[:home][:players].length do
    h_score = h_score + game_hash[:home][:players][i][:points]
    i += 1
    
  end  
  i = 0
  while i < game_hash[:away][:players].length do
     a_score = a_score + game_hash[:away][:players][i][:points]
    i += 1
    
  end
  if h_score > a_score 
    return game_hash[:home][:team_name]
  else
   
    return game_hash[:away][:team_name]
  end
end


def player_numbers(team_name)
  i = 0
  charlotte_numbers = []
  brooklyn_numbers = []
  numbers = []
  if team_name == game_hash[:home][:team_name]
    while i < game_hash[:home][:players].length do
      brooklyn_numbers.push(game_hash[:home][:players][i][:number])
      i += 1
    end
  end
    i = 0
  if team_name == game_hash[:away][:team_name]
    while i < game_hash[:away][:players].length do
      charlotte_numbers.push(game_hash[:away][:players][i][:number])
      i += 1
    end
  end
  numbers.concat(charlotte_numbers)
  numbers.concat(brooklyn_numbers)
  return numbers
end


def player_stats(player)
  game_hash.each do |place, team|
    i = 0
    while i < team[:players].length do
      if team[:players][i][:player_name] == player
        team[:players][i].shift
        return team[:players][i]
      end
      i += 1
    end
  end
end


def shoe_size(player)
  game_hash.each do |place, team|
    i = 0
    while i < team[:players].length do
      if team[:players][i][:player_name] == player
        return team[:players][i][:shoe].to_i
      end
      i += 1
    end
  end
end

def num_points_scored(player)
   game_hash.each do |place, team|
    i = 0
    while i < team[:players].length do
      if team[:players][i][:player_name] == player
        return team[:players][i][:points].to_i
      end
      i += 1
    end
  end
end

def long_name_steals_a_ton?
  return true 
end

