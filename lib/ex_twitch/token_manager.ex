defmodule ExTwitch.TokenManager do
  use GenServer

  @token_manager :ex_twitch_token_manager

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: @token_manager)
  end

  def init(args) do
    {:ok, args}
  end

  def token() do
    GenServer.call(@token_manager, :token)
  end

  def handle_call(:token, _from, state) do
    {:reply, {:ok, "token"}, state}
  end
end
