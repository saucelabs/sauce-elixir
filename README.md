<div style="margin:0px auto; width:100%; text-align:center;">
    <img src="https://raw.githubusercontent.com/saucelabs/sauce-elixir/master/img/elixir_sauce_bot.png" alt="Elixir Saucebot" />
    <h1><span style="color:#d92e27;">Sauce</span><span style="color:#5b326d;">Elixir</span></h1>
    [![Build Status](https://travis-ci.org/saucelabs/sauce-elixir.svg?branch=master)](https://travis-ci.org/saucelabs/sauce-elixir.svg?branch=master)
    ![Language](https://img.shields.io/badge/language-elixir-green.svg)
    [![Latest Release][release badge](https://img.shields.io/github/last-commit/saucelabs/sauce-elixir.svg)
    [![Last Commit][commit badge](https://img.shields.io/github/release/saucelabs/sauce-elixir.svg)
    <p>Elixir client library for Sauce Labs API</p>
    <hr />
</div>



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

 ## Documentation

 * https://hexdocs.pm/sauce_elixir/0.1.0/
 * https://hex.pm/packages/sauce_elixir/0.1.0

<!-- Links (alphabetically) -->
[commit]: https://github.com/saucelabs/sauce-elixir/commit/HEAD
[release]: https://github.com/saucelabs/sauce-elixir/releases/latest

<!-- Badges (alphabetically) -->
[commit badge]: https://img.shields.io/github/last-commit/saucelabs/sauce-elixir.svg
[release badge]: https://img.shields.io/github/release/saucelabs/sauce-elixir.svg
