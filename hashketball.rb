def game_hash 
  game = {
    :home => {
    	:team_name => 'Brooklyn Nets',
    	:colors => ['Black', 'White'],
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
    	:team_name => 'Charlotte Hornets',
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

def num_points_scored(name)
  puts "num_points_scored"
  pp name
  
  game_hash.each do |side, team|
    puts "game_hash.each..."
    puts side #=> home/away
    puts team #=> team hash data
    
    team.each do |attribute, data|
      puts "team.each..."
      puts "attribute = #{attribute}"
      
      if attribute == :players
        puts "attribute is :players..."
        
        data.each do |player, stats|
          puts player
          puts stats[:points]
          return stats[:points] if player == name
        end #=> END [:players] => data.each
        
      end #=> END if attribute == :players
    end #=> END team.each
  end #=> END game_hash.each
end #=> END num_points_scored

def shoe_size(name)
  puts "shoe_size"
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          puts player
          puts stats[:points]
          return stats[:shoe] if player == name
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    end #=> END team.each
    
  end #=> END game_hash.each
end #=> END shoe_size

def team_colors(team_name)
  puts "team_colors"
  
  game_hash.each do |side, team|
    return game_hash[side][:colors] if team[:team_name] == team_name
  end
  
end

def team_names
  puts "team_names"
  teams = []
  game_hash.each do |side, team|
    teams.push(team[:team_name])
  end
  teams
end

def player_numbers(team_name)
  puts "player_numbers"
  numbers = []
  game_hash.each do |side, team|
    
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            puts player
            puts stats[:number]
            numbers.push(stats[:number])
            pp numbers
          end #=> END [:players] => data.each
        end #=> END if attribute == :players
      end #=> END team.each
    end #=> END if [:team_name] == team_name
  end
  numbers.sort
end

def player_stats(name)
  puts "player_stats"
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        
        data.each do |player, stats|
          puts player
          puts stats
          return stats if player == name
        end #=> END [:players].data.each
        
      end #=> END if attribute == :players
    end #=> END team.each
    
  end #=> END game_hash.each
end #=> END player_stats

def big_shoe_rebounds
  puts "big_shoe_rebounds"
  shoe_sizes = {}
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          puts player
          #puts stats[:shoe]
          shoe_sizes[player] = {}
          shoe_sizes[player][:shoe] = stats[:shoe]
          shoe_sizes[player][:rebounds] = stats[:rebounds]
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    
    end #=> END team.each
    
  end #=> END game_hash.each
  puts shoe_sizes
  reverse = shoe_sizes.sort_by {|k, v| -v[:shoe]}
  biggest_shoe = reverse[0][0]
  puts biggest_shoe
  
  shoe_sizes[biggest_shoe][:rebounds]
end

def most_points_scored
  puts "most_points_scored"
  points_scored = {}
  
  game_hash.each do |side, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          points_scored[player] = {}
          points_scored[player][:points] = stats[:points]
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    end #=> END team.each
  end #=> END game_hash.each
  
  reverse = points_scored.sort_by {|k, v| -v[:points]}
  most_points = reverse[0][0]
  
  most_points
end

def winning_team
  puts "winning_team"
  totals = {}
  pp totals
  
  game_hash.each do |side, team|
    totals[side] = {}
    totals[side][:team_name] = team[:team_name]
    totals[side][:points] = 0
    
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          puts "stats:points"
          pp stats[:points]
          puts "total.side.points"
          totals[side][:points] += stats[:points]
          puts totals[side]
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    end #=> END team.each

    pp totals[side][:team_name]
    
  end #=> END game_hash.each
  
  reverse = totals.sort_by {|k, v| -v[:points]}
  winning_team = reverse[0][0]

  totals[winning_team][:team_name]
end

def player_with_longest_name
  puts "player_with_longest_name"
  player_stats= {}
  
  game_hash.each do |side, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          player_stats[player] = {}
          player_stats[player][:length] = player.length
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    end #=> END team.each
  end #=> END game_hash.each
  
  reverse = player_stats.sort_by {|k, v| -v[:length]}
  longest_name = reverse[0][0]
  
  longest_name
end

def long_name_steals_a_ton?
  puts "long_name_steals_a_ton?"
  player_stats = {}
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          puts player
          #puts stats[:shoe]
          player_stats[player] = {}
          player_stats[player][:length] = player.length
          player_stats[player][:steals] = stats[:steals]
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    
    end #=> END team.each
    
  end #=> END game_hash.each
  puts player_stats
  most_steals = player_stats.sort_by {|k, v| -v[:steals]}
  longest_name = player_stats.sort_by {|k, v| -v[:length]}
  
  puts most_steals[0][0]
  puts longest_name[0][0]

  longest_name[0][0] == most_steals[0][0] 
end