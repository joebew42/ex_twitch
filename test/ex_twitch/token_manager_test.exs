defmodule ExTwitch.TokenManagerTest do
  use ExUnit.Case, async: true

  import Mock

  alias ExTwitch.Token
  alias ExTwitch.TokenManager

  setup do
    start_supervised TokenManager

    %{}
  end

  test "should return the token" do
    {:ok, token} = TokenManager.token()

    assert String.length(token) == 30
  end

  test "should renew an expired token" do
    with_mock Token, [create: &random_token/0]  do
      {:ok, first_token} = TokenManager.token()
      Process.sleep(2000)

      {:ok, renewed_token} = TokenManager.token()

      assert renewed_token != first_token
    end
  end

  defp random_token() do
    %{token: UUID.uuid1(:hex), expires_in: 1000}
  end
end
