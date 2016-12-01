visitedPlaces = [{0, 0}]
direction = {"N", 0, 0, visitedPlaces}

moves = Enum.map([
    "L1", "L3", "L5", "L3", "R1", "L4", "L5", "R1", "R3", "L5", "R1", "L3", "L2", "L3", "R2", "R2", "L3", "L3", "R1", "L2", "R1", "L3", "L2", "R4", "R2", "L5", "R4", "L5", "R4", "L2", "R3", "L2", "R4", "R1", "L5", "L4", "R1", "L2", "R3", "R1", "R2", "L4", "R1", "L2", "R3", "L2", "L3", "R5", "L192", "R4", "L5", "R4", "L1", "R4", "L4", "R2", "L5", "R45", "L2", "L5", "R4", "R5", "L3", "R5", "R77", "R2", "R5", "L5", "R1", "R4", "L4", "L4", "R2", "L4", "L1", "R191", "R1", "L1", "L2", "L2", "L4", "L3", "R1", "L3", "R1", "R5", "R3", "L1", "L4", "L2", "L3", "L1", "L1", "R5", "L4", "R1", "L3", "R1", "L2", "R1", "R4", "R5", "L4", "L2", "R4", "R5", "L1", "L2", "R3", "L4", "R2", "R2", "R3", "L2", "L3", "L5", "R3", "R1", "L4", "L3", "R4", "R2", "R2", "R2", "R1", "L4", "R4", "R1", "R2", "R1", "L2", "L2", "R4", "L1", "L2", "R3", "L3", "L5", "L4", "R4", "L3", "L1", "L5", "L3", "L5", "R5", "L5", "L4", "L2", "R1", "L2", "L4", "L2", "L4", "L1", "R4", "R4", "R5", "R1", "L4", "R2", "L4", "L2", "L4", "R2", "L4", "L1", "L2", "R1", "R4", "R3", "R2", "R2", "R5", "L1", "L2"
], fn x -> {String.slice(x, 0, 1), elem(Integer.parse(String.slice(x, 1, 10)), 0)} end)


result = Enum.reduce(moves, direction, fn(move, acc) ->
        case acc do
            {"N", x, y, visitedPlaces} ->
                case move do
                    {"L", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x - step, y})) do
                                IO.puts x - step
                                IO.puts y
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x - step, y} end)
                        # IO.puts (length newVisitedPlaces)
                        {"W", x - distance, y, newVisitedPlaces}
                    {"R", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x + step, y})) do
                                # IO.puts Enum.at(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), 0)
                                IO.puts x + step
                                IO.puts y
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x + step, y} end)
                        {"E", x + distance, y, newVisitedPlaces}
                end
            {"E", x, y, visitedPlaces} ->
                case move do
                    {"L", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x, y + step})) do
                                IO.puts x
                                IO.puts y+step
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x, y + step} end)
                        {"N", x, y + distance, newVisitedPlaces}
                    {"R", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x, y - step})) do
                                IO.puts x
                                IO.puts y - step
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x, y - step} end)
                        {"S", x, y - distance, newVisitedPlaces}
                end
            {"S", x, y, visitedPlaces} ->
                case move do
                    {"L", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x + step, y})) do
                                IO.puts x + step
                                IO.puts y
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x + step, y} end)
                        {"E", x + distance, y, newVisitedPlaces}
                    {"R", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x - step, y})) do
                                IO.puts x - step
                                IO.puts y
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x - step, y} end)
                        {"W", x - distance, y, newVisitedPlaces}
                end
            {"W", x, y, visitedPlaces} ->
                case move do
                    {"L", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x, y - step})) do
                                IO.puts x
                                IO.puts y - step
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x, y - step} end)
                        {"S", x, y - distance, newVisitedPlaces}
                    {"R", distance} ->
                        Enum.each 1..distance, fn step ->
                            if Enum.member?(Enum.map(visitedPlaces, fn x -> Tuple.to_list(x) end), Tuple.to_list({x, y + step})) do
                                IO.puts x
                                IO.puts y + step
                                IO.puts "\n"
                            end
                        end
                        newVisitedPlaces = visitedPlaces ++ Enum.map(1..distance, fn step -> {x, y + step} end)
                        {"N", x, y + distance, newVisitedPlaces}
                end
        end
                
    end
)

# IO.puts Enum.join(Tuple.to_list(result))