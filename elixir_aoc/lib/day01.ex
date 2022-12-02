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

  defp calories_per_elf2(calorie_table) do
    calorie_table
    |> parse()
    |> chunk_by_elf()
    |> Enum.to_list()
    |> Enum.map(&Enum.sum/1)
  end

  defp parse(lines) do
    lines
    |> Stream.map(fn line ->
      case line do
        "" ->
          :next

        calorie_string ->
          {calorie, _} = Integer.parse(calorie_string)
          calorie
      end
    end)
  end

  defp chunk_by_elf(calorie_list) do
    calorie_list
    |> Stream.chunk_by(&(&1 == :next))
    |> Stream.filter(&(&1 != [:next]))
  end

  def part1(calorie_table) do
    calories_per_elf2(calorie_table)
    |> Enum.max()
  end

  def part2(calorie_table) do
    calories_per_elf2(calorie_table)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum()
  end
end
