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

  def get_job(server, job_id) do
    GenServer.call(server, {:get_job, job_id})
  end

  # CALLBACKS

  def init(state) do
    credentials = Enum.at(state, 0)
    IO.puts("Event loop started for: #{Map.get(credentials, :username)}")
    {:ok, credentials}
  end

  def handle_call({:get_job, job_id}, _from, credentials) do
    endpoint = Endpoints.Jobs.get(job_id)
    response = Requester.call(endpoint[:method], endpoint[:url], credentials)
    {:reply, response, credentials}
  end

end
