defmodule ExTwitch.TokenManager do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: :ex_twitch_token_manager)
  end

  def init(args) do
    {:ok, args}
  end

  def token() do
    GenServer.call(:ex_twitch_token_manager, :token)
  end

  def handle_call(:token, _from, state) do
    {:reply, {:ok, "token"}, state}
  end
end
