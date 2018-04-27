defmodule ExTwitch.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_twitch,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 0.10.0"},
      {:poison, "~> 3.1"},
      {:mock, "~> 0.3.0", only: :test},
      {:uuid, "~> 1.1", only: :test}
    ]
  end
end
