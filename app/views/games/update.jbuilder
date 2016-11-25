json.game do
  json.board @game.board.board.map { |row| row.map { |tile| tile.status } }
  json.shotsLeft @game.shots_remaining
  json.boats @game.board.boats.group_by(&:class).reduce({}){ |h, (k,v)| h[k] = v.reduce(0) {|c,b| b.sunk? ? c : c + 1}; h }
  json.score @game.score if @game.game_over?
  json.gameOver @game.game_over?
end
