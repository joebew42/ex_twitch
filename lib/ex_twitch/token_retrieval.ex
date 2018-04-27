defmodule ExTwitch.TokenRetrieval do
  use Tesla

  @twitch_client_id System.get_env("TWITCH_CLIENT_ID")
  @twitch_secret System.get_env("TWITCH_SECRET")

  plug Tesla.Middleware.BaseUrl, "https://id.twitch.tv/oauth2"
  plug Tesla.Middleware.JSON

  def create_token() do
    %Tesla.Env{body: %{"access_token" => token, "expires_in" => expiration_in_seconds}} = post("token?client_id=" <> @twitch_client_id <> "&client_secret=" <> @twitch_secret <> "&grant_type=client_credentials", "")
    %{token: token, expires_in: expiration_in_seconds * 1000}
  end
end
