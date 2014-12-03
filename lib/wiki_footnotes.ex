defmodule WikiFootnotes do

  def fetch({:url, url}) do
    _fetch(url)
  end

  def fetch(subject) do
    subject |> wikipedia_url |> _fetch
  end

  def _fetch(url) do
    url
      |> HTTPoison.get
      |> handle_response
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
    "http://en.wikipedia.org/wiki/#{String.capitalize(subject)}"
  end
end
