defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "Day 01 Part 1 Test" do
    calorie_table = Helpers.read_lines!("test/data/day01_part1_test.txt")
    assert(Day01.part1(calorie_table) == 24000)
  end

  test "Day 01 Part 1" do
    calorie_table = Helpers.read_lines!("test/data/day01_part1.txt")
    assert(Day01.part1(calorie_table) == 69912)
  end

  test "Day 01 Part 2 Test" do
    calorie_table = Helpers.read_lines!("test/data/day01_part1_test.txt")
    assert(Day01.part2(calorie_table) == 45000)
  end

  test "Day 01 Part 2" do
    calorie_table = Helpers.read_lines!("test/data/day01_part1.txt")
    assert(Day01.part2(calorie_table) == 208180)
  end

  test "Day 02 Part 1 Test" do
    strategy_guide = Helpers.read_lines_flow!("test/data/day02_test.txt")
    assert(Day02.part1(strategy_guide) == 15)
  end

  test "Day 02 Part 1" do
    strategy_guide = Helpers.read_lines_flow!("test/data/day02.txt")
    assert(Day02.part1(strategy_guide) == 13675)
  end

  test "Day 02 Part 2 Test" do
    strategy_guide = Helpers.read_lines_flow!("test/data/day02_test.txt")
    assert(Day02.part2(strategy_guide) == 12)
  end

  test "Day 02 Part 2" do
    strategy_guide = Helpers.read_lines_flow!("test/data/day02.txt")
    assert(Day02.part2(strategy_guide) == 14184)
  end

end
