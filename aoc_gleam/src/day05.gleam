import gleam/io.{debug}
import gleam/list.{fold, map, reverse, take}
import gleam/string
import gleam/regex.{Match}
import gleam/map.{Map}
import gleam/int
import gleam/option.{Some}

pub fn part1(stacks_and_instructions: List(List(String))) -> String {
  find_top_crates(stacks_and_instructions, crate_mover_9000_lift)
}

pub fn part2(stacks_and_instructions: List(List(String))) -> String {
  find_top_crates(stacks_and_instructions, crate_mover_9001_lift)
}

fn crate_mover_9000_lift(crates: List(String)) {
  list.reverse(crates)
}

fn crate_mover_9001_lift(crates: List(String)) {
  crates
}

fn find_top_crates(
  stacks_and_instructions: List(List(String)),
  crane: fn(List(String)) -> List(String),
) -> String {
  assert [stacks, instructions] = stacks_and_instructions

  assert [stack_indexes, ..crates] =
    stacks
    |> reverse()

  init_stacks(stack_indexes)
  |> parse_stacks(crates)
  |> move_crates(instructions, crane)
  |> extract_message()
}

fn init_stacks(stack_indexes: String) {
  assert Ok(re) = regex.from_string("\\s+")
  stack_indexes
  |> string.trim()
  |> regex.split(with: re)
  |> fold(
    map.new(),
    fn(stacks, index) {
      assert Ok(i) = int.parse(index)
      map.insert(stacks, i, [])
    },
  )
}

fn parse_stacks(stacks: Map(Int, List(String)), crates: List(String)) {
  let indexes = list.range(1, list.length(map.keys(stacks)))

  crates
  |> fold(stacks, fn(stacks, layer) { parse_layer(indexes, stacks, layer) })
}

fn parse_layer(
  indexes: List(Int),
  stacks: Map(Int, List(String)),
  layer: String,
) {
  indexes
  |> fold(stacks, fn(stacks, index) { parse_crate(stacks, layer, index) })
}

fn parse_crate(stacks: Map(Int, List(String)), layer: String, index: Int) {
  assert Ok(crate_re) = regex.from_string("\\[(.+)\\].*")
  let crate_str = string.slice(layer, { index - 1 } * 4, 4)
  assert Ok(crates) = map.get(stacks, index)
  case regex.scan(crate_re, crate_str) {
    [regex.Match(_, [Some(crate)])] ->
      stacks
      |> map.insert(index, [crate, ..crates])
    _ -> stacks
  }
}

fn move_crates(
  stacks: Map(Int, List(String)),
  instructions: List(String),
  lift: fn(List(String)) -> List(String),
) {
  instructions
  |> fold(
    stacks,
    fn(stack, instruction_string) {
      let instruction = parse_instruction(instruction_string)
      assert Ok(from_stack) = map.get(stack, instruction.from)
      assert Ok(to_stack) = map.get(stack, instruction.to)
      let crates_to_move =
        from_stack
        |> take(instruction.number)
        |> lift()
      stack
      |> map.insert(instruction.to, list.append(crates_to_move, to_stack))
      |> map.insert(
        instruction.from,
        from_stack
        |> list.drop(instruction.number),
      )
    },
  )
}

type Instruction {
  Instruction(number: Int, from: Int, to: Int)
}

fn parse_instruction(instruction: String) -> Instruction {
  assert Ok(instruction_re) =
    regex.from_string("move (\\d+) from (\\d+) to (\\d+)")
  assert [Match(_, [Some(number), Some(from), Some(to)])] =
    regex.scan(instruction_re, instruction)
  assert Ok(number_int) = int.parse(number)
  assert Ok(from_int) = int.parse(from)
  assert Ok(to_int) = int.parse(to)
  Instruction(number_int, from_int, to_int)
}

fn extract_message(stacks: Map(Int, List(String))) {
  stacks
  |> map.keys()
  |> list.sort(int.compare)
  |> fold(
    "",
    fn(message, stack_index) {
      case map.get(stacks, stack_index) {
        Ok([top, ..]) -> message <> top
        _ -> message
      }
    },
  )
}
