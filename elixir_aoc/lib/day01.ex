defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  defp calories_per_elf(calorie_table) do
    Enum.chunk_by(calorie_table, &(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(fn elf_calories ->
      Enum.map(elf_calories, fn calorie_str ->
        {calorie, _} = Integer.parse(calorie_str)
        calorie
      end)
      |> Enum.sum()
    end)

  end

  def part1(calorie_table) do
    calories_per_elf(calorie_table)
    |> Enum.max()
  end

  def part2(calorie_table) do
    calories_per_elf(calorie_table)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum()
  end
end
