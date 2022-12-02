defmodule Day02 do

  defp parse_rounds(strategy_guide) do
    strategy_guide
      |> Enum.map(&String.split/1)
      |> Enum.map(fn round_list ->
        round_list |> Enum.map(fn hand ->
          case hand do
            "A" -> 1
            "B" -> 2
            "C" -> 3
            "X" -> 1
            "Y" -> 2
            "Z" -> 3
          end
        end)
      end)
      |> Enum.map(fn [elf, you] -> {elf, you} end)
  end

  defp calculate_score_1(rounds) do
    rounds
      |> Enum.map(fn round ->
        case round do
          {a, a} -> a + 3
          {1, a} when a == 2 -> a + 6
          {2, a} when a == 3 -> a + 6
          {3, a} when a == 1 -> a + 6
          {_, a} -> a + 0
        end
      end)
  end

  defp calculate_score_2(rounds) do
    rounds
      |> Enum.map(fn round ->
        case round do
          {1, 1} -> 3
          {2, 1} -> 1
          {3, 1} -> 2
          {a, 2} -> a + 3
          {1, 3} -> 2 + 6
          {2, 3} -> 3 + 6
          {3, 3} -> 1 + 6
        end
      end)
  end

  def part1(strategy_guide) do
    strategy_guide
      |> parse_rounds()
      |> calculate_score_1()
      |> Enum.sum()
  end

  def part2(strategy_guide) do
    strategy_guide
      |> parse_rounds()
      |> calculate_score_2()
      |> Enum.sum()
  end

end
