import gleeunit
import gleeunit/should
import helpers/input
import day02
import day03
import day04
import day05

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

pub fn day04_part1_example_test() {
  let pairs = input.read_lines("test/data/day04_test.txt")
  pairs
  day04.part1(pairs)
  |> should.equal(2)
}

pub fn day04_part1_test() {
  let pairs = input.read_lines("test/data/day04.txt")
  pairs
  day04.part1(pairs)
  |> should.equal(503)
}

pub fn day04_part2_example_test() {
  let pairs = input.read_lines("test/data/day04_test.txt")
  pairs
  day04.part2(pairs)
  |> should.equal(4)
}

pub fn day04_part2_test() {
  let pairs = input.read_lines("test/data/day04.txt")
  pairs
  day04.part2(pairs)
  |> should.equal(827)
}

pub fn day05_part1_examples_test() {
  let stacks_and_instructions =
    input.read_chunks_of_lines("test/data/day05_example.txt")
  day05.part1(stacks_and_instructions)
  |> should.equal("CMZ")
}

pub fn day05_part1_test() {
  let stacks_and_instructions =
    input.read_chunks_of_lines("test/data/day05.txt")
  day05.part1(stacks_and_instructions)
  |> should.equal("CNSZFDVLJ")
}

pub fn day05_part2_examples_test() {
  let stacks_and_instructions =
    input.read_chunks_of_lines("test/data/day05_example.txt")
  day05.part2(stacks_and_instructions)
  |> should.equal("MCD")
}

pub fn day05_part2_test() {
  let stacks_and_instructions =
    input.read_chunks_of_lines("test/data/day05.txt")
  day05.part2(stacks_and_instructions)
  |> should.equal("QNDWLMGNS")
}
