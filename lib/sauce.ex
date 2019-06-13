defmodule Sauce do
  use GenServer

  # API

  def start(username, access_key, base_url \\ "https://saucelabs.com") do
    GenServer.start_link(__MODULE__, [username, access_key, base_url])
  end

  def get_job(server, job_id) do
    GenServer.call(server, {:get_job, job_id})
  end

  # CALLBACKS

  def init([username, access_key, base_url]) do
    credentials = %{
      :username => username,
      :access_key => access_key,
      :base_url => base_url
    }
    {:ok, credentials}
  end

  def handle_call({:get_job, job_id}, _from, credentials) do
    endpoint = Endpoints.Jobs.get(job_id)
    response = Requester.call(endpoint[:method], endpoint[:url], credentials)
    {:reply, response, credentials}
  end

end
