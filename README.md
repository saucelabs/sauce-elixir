# SauceElixir

![Language](https://img.shields.io/badge/language-elixir-yellowgreen.svg)
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
{:ok, server} = Sauce.start("sauce-username", "sauce-access-key")
Sauce.Jobs.get(server, "job-id")

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

<!-- Links (alphabetically) -->
[commit]: https://github.com/saucelabs/sauce-elixir/commit/HEAD
[release]: https://github.com/saucelabs/sauce-elixir/releases/latest

<!-- Badges (alphabetically) -->
[commit badge]: https://img.shields.io/github/last-commit/paweldudzinski/cast.svg
[release badge]: https://img.shields.io/github/release/paweldudzinski/cast.svg
