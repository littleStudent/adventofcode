direction = {"N", 0, 0}

moves = Enum.map([
    "L1", "L3", "L5", "L3", "R1", "L4", "L5", "R1", "R3", "L5", "R1", "L3", "L2", "L3", "R2", "R2", "L3", "L3", "R1", "L2", "R1", "L3", "L2", "R4", "R2", "L5", "R4", "L5", "R4", "L2", "R3", "L2", "R4", "R1", "L5", "L4", "R1", "L2", "R3", "R1", "R2", "L4", "R1", "L2", "R3", "L2", "L3", "R5", "L192", "R4", "L5", "R4", "L1", "R4", "L4", "R2", "L5", "R45", "L2", "L5", "R4", "R5", "L3", "R5", "R77", "R2", "R5", "L5", "R1", "R4", "L4", "L4", "R2", "L4", "L1", "R191", "R1", "L1", "L2", "L2", "L4", "L3", "R1", "L3", "R1", "R5", "R3", "L1", "L4", "L2", "L3", "L1", "L1", "R5", "L4", "R1", "L3", "R1", "L2", "R1", "R4", "R5", "L4", "L2", "R4", "R5", "L1", "L2", "R3", "L4", "R2", "R2", "R3", "L2", "L3", "L5", "R3", "R1", "L4", "L3", "R4", "R2", "R2", "R2", "R1", "L4", "R4", "R1", "R2", "R1", "L2", "L2", "R4", "L1", "L2", "R3", "L3", "L5", "L4", "R4", "L3", "L1", "L5", "L3", "L5", "R5", "L5", "L4", "L2", "R1", "L2", "L4", "L2", "L4", "L1", "R4", "R4", "R5", "R1", "L4", "R2", "L4", "L2", "L4", "R2", "L4", "L1", "L2", "R1", "R4", "R3", "R2", "R2", "R5", "L1", "L2"
], fn x -> {String.slice(x, 0, 1), elem(Integer.parse(String.slice(x, 1, 10)), 0)} end)

result = Enum.reduce(moves, direction, fn(move, acc) ->
        case acc do
            {"N", x, y} ->
                case move do
                    {"L", distance} ->
                        {"W", x - distance, y}
                    {"R", distance} ->
                        {"E", x + distance, y}
                end
            {"E", x, y} ->
                case move do
                    {"L", distance} ->
                        {"N", x, y + distance}
                    {"R", distance} ->
                        {"S", x, y - distance}
                end
            {"S", x, y} ->
                case move do
                    {"L", distance} ->
                        {"E", x + distance, y}
                    {"R", distance} ->
                        {"W", x - distance, y}
                end
            {"W", x, y} ->
                case move do
                    {"L", distance} ->
                        {"S", x, y - distance}
                    {"R", distance} ->
                        {"N", x, y + distance}
                end
        end
                
    end
)

IO.puts Enum.join(Tuple.to_list(result))