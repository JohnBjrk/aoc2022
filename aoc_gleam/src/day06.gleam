import gleam/list.{find, index_map, length, map, window}
import gleam/string
import gleam/set
import gleam/option.{None, Some}

pub fn part1(signals: List(String)) -> List(Int) {
  find_first_window(signals, 4)
}

pub fn part2(signals: List(String)) -> List(Int) {
  find_first_window(signals, 14)
}

fn find_first_window(signals: List(String), window_size: Int) {
  signals
  |> map(fn(signal) {
    assert Ok(Some(#(index, _))) =
      signal
      |> string.split("")
      |> window(window_size)
      |> index_map(fn(index, window) {
        let unique = set.from_list(window)
        case length(window) == set.size(unique) {
          True -> Some(#(index + window_size, window))
          False -> None
        }
      })
      |> find(fn(signal) {
        case signal {
          Some(_) -> True
          None -> False
        }
      })
    index
  })
}
