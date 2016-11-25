json.initialBoard @game.board.board.map { |row| row.map { |tile| tile.status } }
json.initialBoats @game.board.boats.group_by(&:class).reduce({}){ |h, (k,v)| h[k] = v.reduce(0) {|c,b| b.sunk? ? c : c + 1}; h }
json.initialShots @game.starting_shots
json.signedIn user_signed_in?
json.loginPath new_user_registration_path

