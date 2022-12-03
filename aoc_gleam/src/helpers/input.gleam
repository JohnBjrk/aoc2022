import gleam/erlang/file
import gleam/string

pub fn read_file(path: String) {
  assert Ok(content) = file.read(path)
  content
}

pub fn read_lines(path: String) -> List(String) {
  use content <- read(path)
  string.split(content, "\n")
}

fn read(path: String, continue) {
  case file.read(path) {
    Ok(content) -> continue(content)
    _ -> []
  }
}
