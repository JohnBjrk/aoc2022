import gleam/erlang/file
import gleam/string
import gleam/list.{map}

pub fn read_file(path: String) {
  assert Ok(content) = file.read(path)
  content
}

pub fn read_lines(path: String) -> List(String) {
  use content <- read(path)
  string.split(content, "\n")
}

pub fn read_chunks_of_lines(path: String) -> List(List(String)) {
  case file.read(path) {
    Ok(content) ->
      string.split(content, "\n\n")
      |> map(fn(chunk) { string.split(chunk, "\n") })
    _ -> []
  }
}

fn read(path: String, continue) {
  case file.read(path) {
    Ok(content) -> continue(content)
    _ -> []
  }
}
