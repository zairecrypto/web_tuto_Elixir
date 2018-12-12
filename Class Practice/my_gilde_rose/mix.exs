defmodule MyGildeRose.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_gilde_rose,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(), # DO NOT FORGET TO ADD THIS COMMA
      test_coverage: [tool: Coverex.Task] # THIS IS THE LINE TO ADD!!
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:coverex, "~> 1.4.10", only: :test}  # THIS IS THE LINE TO ADD!!
    ]
  end
end
