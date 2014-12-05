defmodule WikiFootnotes do
  require Logger
  
  @root_url Application.get_env(:wikipedia, :root_url)

  def fetch({:url, url}) do
    _fetch(url)
  end

  def fetch(subject) do
    subject |> wikipedia_url |> _fetch
  end

  def _fetch(url) do
    Logger.info "Fetching content at #{url}"
    url
      |> HTTPoison.get
      |> handle_response
      |> WikiFootnotes.Parser.run
      |> console_display
  end

  defp console_display(hrefs_and_text) do
    hrefs_and_text 
      |> Enum.map(fn [a,b] -> if a == b, do: ["_", b], else: [a,b] end)
      |> Enum.map(fn [a,b] -> [String.ljust(a, 40), b] end)
      |> Enum.map(&Enum.join/1) |> Enum.join("\n")
      |> IO.puts
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}), do: body
  defp handle_response({:ok, %{status_code: 301, headers: headers}}) do
    _fetch(headers["Location"])
  end
  defp handle_response({:ok, %{status_code: status, headers: headers}}) do
    "Unexpected #{status} http code\n#{IO.inspect(headers)}"
  end
  defp handle_response({:error, %{id: _, reason: reason}}), do: reason 

  defp wikipedia_url(subject) do
    "#{@root_url}/#{String.capitalize(subject)}"
  end
end
