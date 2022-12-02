import gleeunit
import gleeunit/should
import helpers/input
import day02

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
