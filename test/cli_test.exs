defmodule CliTest do
  use ExUnit.Case

  import WikiFootnotes.CLI

  test "theme returned if one given" do
    assert parse_args(["elixir"]) == "elixir"
  end

  test "usage returned if nothing given" do
    assert parse_args([]) == :usage
  end
  
end
