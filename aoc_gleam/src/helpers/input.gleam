import gleam/erlang/file

pub fn read_file(path: String) {
  assert Ok(content) = file.read(path)
  content
}
