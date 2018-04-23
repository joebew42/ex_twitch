defmodule ExTwitch.TokenManager do
  use GenServer
  use Tesla

  @twitch_client_id System.get_env("TWITCH_CLIENT_ID")
  @twitch_secret System.get_env("TWITCH_SECRET")

  @token_manager :ex_twitch_token_manager

  plug Tesla.Middleware.BaseUrl, "https://id.twitch.tv/oauth2"
  plug Tesla.Middleware.JSON

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: @token_manager)
  end

  def init(_args) do
    token = create_token()
    {:ok, token}
  end

  def token() do
    GenServer.call(@token_manager, :token)
  end

  def handle_call(:token, _from, token) do
    {:reply, {:ok, token}, token}
  end

  defp create_token() do
    %Tesla.Env{body: %{"access_token" => token}} = post("token?client_id=" <> @twitch_client_id <> "&client_secret=" <> @twitch_secret <> "&grant_type=client_credentials", "")
    token
  end
end
