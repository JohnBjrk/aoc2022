import gleam/list.{filter, flat_map, length, map}
import gleam/string.{split}
import gleam/int.{parse}
import gleam/io.{debug}
import gleam/result.{values}

fn parse_pair(pair: String) -> List(Int) {
  split(pair, ",")
  |> flat_map(split(_, on: "-"))
  |> map(parse(_))
  |> values()
}

fn contains(pair: List(Int)) -> Bool {
  assert [s1, e1, s2, e2] = pair
  case s1, e1, s2, e2 {
    s1, e1, s2, e2 if s1 == s2 || e1 == e2 -> True
    s1, e1, s2, e2 if s1 < s2 && e1 > e2 -> True
    s1, e1, s2, e2 if s1 > s2 && e1 < e2 -> True
    _, _, _, _ -> False
  }
}

fn overlaps(pair: List(Int)) -> Bool {
  assert [s1, e1, s2, e2] = pair
  contains(pair) || case s1, e1, s2, e2 {
    s1, e1, s2, e2 if s1 >= s2 && s1 <= e2 -> True
    s1, e1, s2, e2 if e1 >= s2 && e1 <= e2 -> True
    _, _, _, _ -> False
  }
}

pub fn part1(pairs: List(String)) -> Int {
  pairs
  |> map(parse_pair(_))
  |> filter(contains(_))
  |> length()
}

pub fn part2(pairs: List(String)) -> Int {
  pairs
  |> map(parse_pair(_))
  |> filter(overlaps(_))
  |> length()
}
