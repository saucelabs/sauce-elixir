defmodule Sauce do
  use GenServer

  def start(username, access_key, base_url \\ "https://saucelabs.com") do
    GenServer.start_link(Callbacks, [username, access_key, base_url])
  end

  def get_job(server, job_id) do
    GenServer.call(server, {:get_job, job_id})
  end

end
