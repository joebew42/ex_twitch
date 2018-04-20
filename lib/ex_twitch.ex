defmodule ExTwitch do
  defmodule API do
    use Tesla

    @token System.get_env("TWITCH_OAUTH_TOKEN")

    plug Tesla.Middleware.BaseUrl, "https://api.twitch.tv/helix"
    plug Tesla.Middleware.JSON

    def users([login: logins]) do
      data =
        client(@token)
        |> get("/users?" <> build_query_parameters(logins, "login"))
        |> data

      {:ok, data}
    end

    def users([id: ids]) do
      data =
        client(@token)
        |> get("/users?" <> build_query_parameters(ids, "id"))
        |> data

      {:ok, data}
    end

    defp client(token) do
      Tesla.build_client [
        {Tesla.Middleware.Headers, %{"Authorization" => "Bearer " <> token}}
      ]
    end

    defp data(%Tesla.Env{body: %{"data" => data}}), do: data

    defp build_query_parameters(list, parameter) do
      list
      |> Enum.map(& (parameter <> "=" <> &1))
      |> Enum.join("&")
    end
  end
end
