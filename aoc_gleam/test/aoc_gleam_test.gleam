import gleeunit
import gleeunit/should
import helpers/input
import day02
import day03

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`

pub fn day02_part1_example_test() {
  let puzzle = input.read_file("test/data/day02_test.txt")
  day02.part1(puzzle)
  |> should.equal(15)
}

pub fn day02_part1_test() {
  let puzzle = input.read_file("test/data/day02.txt")
  day02.part1(puzzle)
  |> should.equal(13675)
}

pub fn day02_part2_exmaple_test() {
  let puzzle = input.read_file("test/data/day02_test.txt")
  day02.part2(puzzle)
  |> should.equal(12)
}

pub fn day02_part2_test() {
  let puzzle = input.read_file("test/data/day02.txt")
  day02.part2(puzzle)
  |> should.equal(14184)
}

pub fn day03_part1_example_test() {
  let rucksacks = input.read_lines("test/data/day03_test.txt")
  rucksacks
  day03.part1(rucksacks)
  |> should.equal(157)
}

pub fn day03_part1_test() {
  let rucksacks = input.read_lines("test/data/day03.txt")
  rucksacks
  day03.part1(rucksacks)
  |> should.equal(8053)
}

pub fn day03_part2_example_test() {
  let rucksacks = input.read_lines("test/data/day03_test.txt")
  rucksacks
  day03.part2(rucksacks)
  |> should.equal(70)
}

pub fn day03_part2_test() {
  let rucksacks = input.read_lines("test/data/day03.txt")
  rucksacks
  day03.part2(rucksacks)
  |> should.equal(2425)
}
