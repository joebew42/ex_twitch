defmodule ExTwitch.TokenTest do
  use ExUnit.Case, async: true

  alias ExTwitch.Token

  test "should create a new token" do
    %{token: token, expires_in: expiration} = Token.create()

    assert String.length(token) == 30
    assert is_number(expiration)
  end
end
