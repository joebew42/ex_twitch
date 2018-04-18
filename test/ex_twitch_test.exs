defmodule ExTwitchTest do
  use ExUnit.Case

  alias ExTwitch.API

  describe "#users" do
    test "find user by login" do
      {:ok, [user]} = API.users(login: ["joebew42"])

      assert user.login == "joebew42"
    end
  end
end
