defmodule Sauce do
  use GenServer

  def start(username, access_key, base_url \\ "https://saucelabs.com") do
    GenServer.start_link(Callbacks, [username, access_key, base_url])
  end

  defmodule Jobs do
    def get(server, job_id) do
      GenServer.call(server, {:get_job, job_id})
    end

    def get_user_jobs(server, username, options \\ []) do
      GenServer.call(server, {:get_user_jobs, username, options})
    end

    def get_build_jobs(server, build_id) do
      GenServer.call(server, {:get_build_jobs, build_id})
    end
  end

  defmodule Builds do
    def get(server) do
      GenServer.call(server, {:get_builds})
    end
  end

  def init(init_arg) do
    {:ok, init_arg}
  end

  defmodule Metrics do
    def get(server, job_id) do
      GenServer.call(server, {:get_metrics, job_id})
    end

    def get_baseline_history(server, job_id) do
      GenServer.call(server, {:get_metrics_baseline_history, job_id})
    end
  end

end
