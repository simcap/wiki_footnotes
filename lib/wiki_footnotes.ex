defmodule WikiFootnotes do

  def fetch(url)

  def fetch(theme) do
    wikipedia_url(theme)
      |> HTTPoison.get
      |> handle_response
      |> IO.puts
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}), do: body
  defp handle_response({:error, %{id: _, reason: reason}}), do: reason 

  defp handle_response({:ok, %{status_code: 301, headers: headers}}) do
    new_theme = headers["Location"] |> String.split("/") |> List.last
    fetch(new_theme)
  end

  defp handle_response({:ok, %{status_code: status, headers: headers}}), do: "Unexpected #{status} http code\n#{IO.inspect(headers)}"

  defp wikipedia_url(theme) do
    "http://en.wikipedia.org/wiki/#{theme}"
  end
end
