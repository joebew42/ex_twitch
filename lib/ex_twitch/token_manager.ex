defmodule ExTwitch.TokenManager do
  use GenServer

  alias ExTwitch.TokenRetrieval

  @token_manager :ex_twitch_token_manager

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: @token_manager)
  end

  def init(_args) do
    send(self(), :retrieve_token)
    {:ok, nil}
  end

  def token() do
    GenServer.call(@token_manager, :token)
  end

  def handle_call(:token, _from, token) do
    {:reply, {:ok, token}, token}
  end

  def handle_info(:retrieve_token, _token) do
    {:noreply, retrieve_token()}
  end

  defp retrieve_token() do
    %{token: token} = TokenRetrieval.create_token()
    token
  end
end
