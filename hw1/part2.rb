class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |player|
    raise NoSuchStrategyError if player[1].match(/[^prsPRS]/) != nil
  end
  # rock beats scissors
  if (game[0][1].downcase == 'r' and game[1][1].downcase == 's')
    return game[0] 
  elsif (game[0][1].downcase == 's' and game[1][1].downcase == 'r')
    return game[1]
  # paper beats rock
  elsif (game[0][1].downcase == 'p' and game[1][1].downcase == 'r')
    return game[0]
  elsif (game[0][1].downcase == 'r' and game[1][1].downcase == 'p')
    return game[1]
  # scissors beat paper
  elsif (game[0][1].downcase == 's' and game[1][1].downcase == 'p')
    return game[0]
  elsif (game[0][1].downcase == 'p' and game[1][1].downcase == 's')
    return game[1]
  # tie
  elsif (game[0][1].downcase == game[1][1].downcase)
    return game[0]
  end
end

def rps_tournament_winner(tournament)
  return tournament.flatten if tournament.flatten.length == 2 
  g_winner = []
  0.step(tournament.flatten.length-1,4) do |i|
    sub = [[tournament.flatten[i], tournament.flatten[i+1]], [tournament.flatten[i+2], tournament.flatten[i+3]]]
    print "here=",sub,"\n"
    g_winner << rps_game_winner(sub)
  end
  print g_winner,"\n"
  rps_tournament_winner(g_winner)
end

# P < S
#puts rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ])

print rps_tournament_winner([
                             [
                              [ ["R1", "R"], ["P1", "P"] ],
                              [ ["S1", "S"],  ["R2", "R"] ],
                             ],
                             [ 
                              [ ["P2", "P"], ["P3", "P"] ],
                              [ ["R3", "R"], ["R4", "R"] ]
                             ]
                            ])
