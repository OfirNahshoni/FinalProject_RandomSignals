function target_cell = checkCell(cell,snakes,ladders)
% This Function Checks Where The Player Need To Go
% get player's current cell and arrays to test (snakes and ladders).
% return the new cell - if not found return the pre cell.
from = 1;
to = 2;
target_cell = cell;

for i = 1:length(snakes)
    if(snakes(i,from) == cell)
        target_cell = snakes(i,to);
        return;
    end
end

for i = 1:length(ladders)
    if(ladders(i,from) == cell)
        target_cell = ladders(i,to);
        return;
    end
end
end