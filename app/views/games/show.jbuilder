json.game do
  json.board @game.board.map { |column| column.map { |tile| tile.status } }
  json.boats @game.boats
  json.shots_remaining @game.shots_remaining
end
