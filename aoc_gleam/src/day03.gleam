import gleam/string.{contains, length, slice, split}
import gleam/list.{flat_map, fold, map, sized_chunk, unique}
import gleam/int.{add}
import gleam/io.{debug}

fn is_uppercase(utf8value: Int) -> Bool {
  case utf8value {
    value if value >= 65 && value <= 90 -> True
    _ -> False
  }
}

fn search_compartment(compartment: String) {
  fn(found_items: List(String), item: String) {
    case
      compartment
      |> contains(item)
    {
      True -> [item, ..found_items]
      False -> found_items
    }
  }
}

fn search_rucksacks(rucksack1: String, rucksack2: String) {
  fn(found_items: List(String), item: String) {
    case contains(rucksack1, item) && contains(rucksack2, item) {
      True -> [item, ..found_items]
      False -> found_items
    }
  }
}

fn get_value(item: String) -> Int {
  let <<v:int>> = <<item:utf8>>
  case is_uppercase(v) {
    True -> v - 65 + 27
    False -> v - 97 + 1
  }
}

pub fn part1(rucksacks: List(String)) -> Int {
  rucksacks
  |> map(fn(rucksack) {
    let half = length(rucksack) / 2
    #(slice(rucksack, 0, half), slice(rucksack, half, half))
  })
  |> flat_map(fn(rucksack) {
    let #(compartment1, compartment2) = rucksack
    split(compartment1, "")
    |> fold([], search_compartment(compartment2))
    |> unique()
  })
  |> map(get_value)
  |> fold(0, add)
}

pub fn part2(rucksacks: List(String)) -> Int {
  rucksacks
  |> sized_chunk(3)
  |> flat_map(fn(rucksacks) {
    let [rucksack1, rucksack2, rucksack3] = rucksacks
    split(rucksack1, "")
    |> fold([], search_rucksacks(rucksack2, rucksack3))
    |> unique()
  })
  |> map(get_value)
  |> fold(0, add)
}
