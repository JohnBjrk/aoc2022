defmodule Helpers do
  def read_lines!(file_path) do
    File.stream!(file_path, [:utf8], :line)
      |> Stream.map(&(String.trim(&1)))
  end

  def read_lines_flow!(file_path) do
    File.stream!(file_path, [:utf8], :line)
      |> Flow.from_enumerable()
      |> Flow.map(&(String.trim(&1)))
  end
end
