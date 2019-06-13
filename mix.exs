defmodule SauceElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :sauce_elixir,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      name: "Sauce Elixir",
      source_url: "https://github.com/saucelabs/sauce-elixir",
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
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
      {:bypass, "~> 1.0", only: :test},
      {:httpoison, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.19", only: :dev},
      {:earmark, "~> 1.1", only: :dev}
    ]
  end
end
