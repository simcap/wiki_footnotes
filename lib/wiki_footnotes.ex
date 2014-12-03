defmodule WikiFootnotes do

  def fetch(page) do
    if Regex.match?(~r/http:/, page) do 
      _fetch(page) 
    else
      page |> wikipedia_url |> _fetch
    end
  end

  def _fetch(url) do
    url
      |> HTTPoison.get
      |> handle_response
      |> IO.puts
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}), do: body
  defp handle_response({:error, %{id: _, reason: reason}}), do: reason 
  defp handle_response({:ok, %{status_code: 301, headers: headers}}) do
    _fetch(headers["Location"])
  end
  defp handle_response({:ok, %{status_code: status, headers: headers}}) do
    "Unexpected #{status} http code\n#{IO.inspect(headers)}"
  end

  defp wikipedia_url(subject) do
    "http://en.wikipedia.org/wiki/#{subject}"
  end
end
