# SauceElixir

[![Build Status](https://travis-ci.org/saucelabs/sauce-elixir.svg?branch=master)](https://travis-ci.org/saucelabs/sauce-elixir.svg?branch=master)
![Language](https://img.shields.io/badge/language-elixir-green.svg)
[![Latest Release][release badge]][release]
[![Last Commit][commit badge]][commit]

Elixir client library for Sauce Labs API

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sauce_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sauce_elixir, "~> 0.1.0"}
  ]
end
```

## Usage example

```elixir
:ok = Sauce.start("sauce-username", "sauce-access-key")
Sauce.Jobs.get("job-id")

{:ok,
 %{
   "collects_automator_log" => false,
   "app" => "",
   "record_video" => true,
   "id" => "job-id",
   "log_url" => "https://assets.saucelabs.com/jobs/job-id/selenium-server.log",
   "proxied" => false,
   "pre_run_executable" => nil,
   "modification_time" => 1560339420,
   "commands_not_successful" => 2,
   ...
 }
 ```

 ## Documentation

 * https://hexdocs.pm/sauce_elixir/0.1.0/
 * https://hex.pm/packages/sauce_elixir/0.1.0

<!-- Links (alphabetically) -->
[commit]: https://github.com/saucelabs/sauce-elixir/commit/HEAD
[release]: https://github.com/saucelabs/sauce-elixir/releases/latest

<!-- Badges (alphabetically) -->
[commit badge]: https://img.shields.io/github/last-commit/saucelabs/sauce-elixir.svg
[release badge]: https://img.shields.io/github/release/saucelabs/sauce-elixir.svg

## Contributing

This project has been started from an internal Hackathon. We would love to have outside contributors chiming in supporting us finishing this. Please have a look at our [contribution guidelines](https://github.com/saucelabs/sauce-elixir/blob/master/CONTRUBUTING.md).
