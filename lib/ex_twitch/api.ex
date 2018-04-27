defmodule ExTwitch.API do
  use Tesla

  alias ExTwitch.TokenManager

  plug Tesla.Middleware.BaseUrl, "https://api.twitch.tv/helix"
  plug Tesla.Middleware.JSON

  def users(opts) do
    login_tuples = Keyword.get(opts, :login) |> to_tuples("login")
    id_tuples = Keyword.get(opts,:id) |> to_tuples("id")

    data =
      read_token()
      |> build_client
      |> get("/users?" <> to_query_parameters(login_tuples ++ id_tuples))
      |> data

    {:ok, data}
  end

  defp read_token() do
    {:ok, token} = TokenManager.token()
    token
  end

  defp build_client(token) do
    Tesla.build_client [
      {Tesla.Middleware.Headers, %{"Authorization" => "Bearer " <> token}}
    ]
  end

  defp data(%Tesla.Env{body: %{"data" => data}}), do: data

  defp get_value(tuples, key) do
    tuples
    |> Enum.find(fn({tuple_key, _value}) -> tuple_key == key end)
    |> get_value
  end

  defp to_tuples(nil, _tuple_key), do: []
  defp to_tuples(list, tuple_key), do: Enum.map(list, & {tuple_key, &1})

  defp to_query_parameters(list) do
    list
    |> Enum.map(fn({key, value}) -> key <> "=" <> value end)
    |> Enum.join("&")
  end
end
