defmodule ExTwitch do
  defmodule API do
    def users([login: [login]]) do
      user = %{login: login}

      {:ok, [user]}
    end
  end
end
