defmodule WikiFootnotes.CLI do

  def main(argv) do
    argv
      |> parse_args
      |> process
  end

  def process(:usage) do
    IO.puts "Usage: wfootnotes <page>"
    System.halt(0)
  end

  def process(page) do
    WikiFootnotes.fetch(page)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv)

    case parse do
      { _, [page], _} -> 
        if Regex.match?(~r/http:/, page) do
          {:url, page}
        else 
          page
        end
       _ -> :usage
    end
  end
end
