defmodule CliTest do
  use ExUnit.Case

  import WikiFootnotes.CLI

  test "subject returned if one given" do
    assert parse_args(["elixir"]) == "elixir"
  end

  test "tuple returned if url given" do
    assert parse_args(["http://elixir"]) == {:url, "http://elixir"}
  end

  test "usage returned if nothing given" do
    assert parse_args([]) == :usage
  end
  
end
