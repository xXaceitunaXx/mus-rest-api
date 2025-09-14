defmodule Mus.MixProject do
  use Mix.Project

  def project do
    [
      app: :mus,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Mus.Application, []}
    ]
  end

  defp deps do
    [
      {:dotenvy, "~> 1.1"},
      {:plug_cowboy, "~> 2.7"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
