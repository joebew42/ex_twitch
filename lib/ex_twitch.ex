defmodule ExTwitch do
  defmodule API do
    use Tesla

    @token System.get_env("TWITCH_OAUTH_TOKEN")

    plug Tesla.Middleware.BaseUrl, "https://api.twitch.tv/helix"
    plug Tesla.Middleware.JSON

    def users(opts) do
      login_tuples = opts |> get_value(:login) |> to_tuples("login")
      id_tuples = opts |> get_value(:id) |> to_tuples("id")

      data =
        client(@token)
        |> get("/users?" <> to_query_parameters(login_tuples ++ id_tuples))
        |> data

      {:ok, data}
    end

    defp client(token) do
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

    defp get_value(nil), do: nil
    defp get_value({_key, value}), do: value

    defp to_tuples(nil, _tuple_key), do: []
    defp to_tuples(list, tuple_key), do: Enum.map(list, & {tuple_key, &1})

    defp to_query_parameters(list) do
      list
      |> Enum.map(fn({key, value}) -> key <> "=" <> value end)
      |> Enum.join("&")
    end
  end
end
