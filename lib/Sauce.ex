defmodule Sauce do
  use GenServer

  # API

  def start(username, access_key, base_url \\ "https://saucelabs.com") do
    IO.puts("Start sauce client: #{username}")
    config = %{
        :username => username,
        :access_key => access_key,
        :base_url => base_url
    }
    GenServer.start_link(__MODULE__, [config])
  end

  # CALLBACKS

  def init(state) do
    credentials = Enum.at(state, 0)
    IO.puts("Event loop started for: #{Map.get(credentials, :username)}")
    {:ok, credentials}
  end

end
