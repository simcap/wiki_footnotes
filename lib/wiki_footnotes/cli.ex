defmodule WikiFootnotes.CLI do

  def run(argv) do
    argv
      |> parse_args
      |> process
  end

  def process(:usage) do
    IO.puts "Usage: wfootnotes <theme>"
    System.halt(0)
  end

  def process(theme) do
    WikiFootnotes.fetch(theme)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv)

    case parse do
      { _, [theme], _} -> theme
      _ -> :usage
    end
  end
end
