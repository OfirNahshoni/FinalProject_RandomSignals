function number_of_throws = SnakesAndLadders()
% This function returns the of steps until the game ends
[snakes,ladders] = initialSnakesLadders();
cell = 0;
number_of_throws = 0;

while(number_of_throws < 400 && cell < 100)
    cell = cell + randi(6);
    number_of_throws = number_of_throws + 1;
    cell = checkCell(cell,snakes,ladders); % Check Snake or Ladder
end
end
