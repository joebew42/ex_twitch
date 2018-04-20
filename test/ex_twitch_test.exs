defmodule ExTwitchTest do
  use ExUnit.Case

  alias ExTwitch.API

  describe "#users" do
    test "find user by login" do
      {:ok, users} = API.users(login: ["joebew42"])

      assert contains?(users, "joebew42")
    end

    test "find users by their logins" do
      {:ok, users} = API.users(login: ["joebew42", "jluiiizz"])

      assert contains?(users, "joebew42")
      assert contains?(users, "jluiiizz")
    end
  end

  defp contains?(users, login) do
    users
    |> Enum.find(& (&1["login"] == login))
  end
end
