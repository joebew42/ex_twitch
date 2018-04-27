defmodule ExTwitch.TokenRetrievalTest do
  use ExUnit.Case, async: true

  alias ExTwitch.TokenRetrieval

  test "should create a new token" do
    %{token: token, expires_in: expiration} = TokenRetrieval.create_token()

    assert String.length(token) == 30
    assert is_number(expiration)
  end
end
