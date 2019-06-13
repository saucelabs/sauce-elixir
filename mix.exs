defmodule SauceElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :sauce_elixir,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
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

  defp description do
    """
    Elixir client library for Sauce Labs API
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Saucelabs"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/saucelabs/sauce-elixir/",
              "Docs" => "https://hexdocs.pm/sauce_elixir/"}
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
