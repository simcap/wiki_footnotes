defmodule WikiFootnotes.Parser do

  @anchors_regex ~r/<a[^>]*href=["'](http[^"']*)[^>]*>(.*)<\/a>/
  @footnotes_start_regex ~r/<ol\sclass=["']references["']>/
  @footnotes_end_regex ~r/<\/ol>/
  
  def run(footnotes_html) do
    extract_footnotes_html(footnotes_html)
      |> capture_footnotes_anchors
  end

  defp extract_footnotes_html(html_page) do
    html_page 
      |> String.split(@footnotes_start_regex) 
      |> List.last 
      |> String.split(@footnotes_end_regex)
      |> List.first
  end

  defp capture_footnotes_anchors(html) do
    Regex.scan(@anchors_regex, html, capture: :all_but_first)
      |> Enum.map(&Enum.reverse/1)
      |> Enum.map(fn [a,b] -> if a == b, do: ["_", b], else: [a,b] end)
      |> Enum.map(fn [a,b] -> [String.ljust(a, 40), b] end)
  end

end
