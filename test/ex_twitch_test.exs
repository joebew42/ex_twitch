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

    test "find user by id" do
      {:ok, users} = API.users(id: ["133262570"])

      assert contains?(users, "joebew42")
    end

    test "find users by their ids" do
      {:ok, users} = API.users(id: ["133262570", "112200789"])

      assert contains?(users, "joebew42")
      assert contains?(users, "jluiiizz")
    end

    test "find users by both their login and id" do
      {:ok, users} = API.users(login: ["joebew42"], id: ["112200789"])

      assert contains?(users, "joebew42")
      assert contains?(users, "jluiiizz")
    end
  end

  defp contains?(users, login) do
    users
    |> Enum.find(& (&1["login"] == login))
  end
end
