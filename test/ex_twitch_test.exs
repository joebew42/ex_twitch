defmodule ExTwitchTest do
  use ExUnit.Case

  alias ExTwitch.API

  @joebew42_id "133262570"
  @jluiiizz_id "112200789"

  describe "#users" do
    test "find user by its login" do
      {:ok, users} = API.users(login: ["joebew42"])

      assert contains?(users, "joebew42")
    end

    test "find users by their logins" do
      {:ok, users} = API.users(login: ["joebew42", "jluiiizz"])

      assert contains?(users, "joebew42")
      assert contains?(users, "jluiiizz")
    end

    test "find user by its id" do
      {:ok, users} = API.users(id: [@joebew42_id])

      assert contains?(users, "joebew42")
    end

    test "find users by their ids" do
      {:ok, users} = API.users(id: [@joebew42_id, @jluiiizz_id])

      assert contains?(users, "joebew42")
      assert contains?(users, "jluiiizz")
    end

    test "find users by both their logins and ids" do
      {:ok, users} = API.users(login: ["joebew42"], id: [@jluiiizz_id])

      assert contains?(users, "joebew42")
      assert contains?(users, "jluiiizz")
    end
  end

  defp contains?(users, login) do
    users
    |> Enum.find(& (&1["login"] == login))
  end
end
