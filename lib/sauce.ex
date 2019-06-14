defmodule Sauce do
  @moduledoc false

  use GenServer

  def start(username, access_key, base_url \\ "https://saucelabs.com") do
    GenServer.start_link(Callbacks, [username, access_key, base_url])
  end

  defmodule Jobs do
    @moduledoc """
      Set of functions for getting jobs information.
    """

    @doc """
      Gets information for a given `job_id`

          iex> Sauce.Jobs.get(server_pid, "id")
    """
    @spec get(pid(), charlist()) :: map()
    def get(server, job_id) do
      GenServer.call(server, {:get_job, job_id})
    end

    @doc """
      Gets list of job ids for a logged user

          iex> Sauce.Jobs.list(server_pid)
    """
    @spec list(pid(), list()) :: map()
    def list(server, options \\ []) do
      GenServer.call(server, {:list, options})
    end

    @doc """
      Gets list of failed jobs for a given `build_id`

          iex> Sauce.Jobs.get_user_failed_jobs(server_pid, "build-id")
          iex> Sauce.Jobs.get_user_failed_jobs(server_pid, "build-id", username: "user100")
    """
    @spec get_build_failed_jobs(pid(), charlist(), list()) :: map()
    def get_build_failed_jobs(server, build_id, options \\ []) do
      GenServer.call(server, {:get_build_failed_jobs, build_id, options})
    end

    @doc """
      Gets list of jobs for a given `build_id`

          iex> Sauce.Jobs.get_build_jobs(server_pid, "build-id")
    """
    @spec get_build_jobs(pid(), charlist()) :: map()
    def get_build_jobs(server, build_id) do
      GenServer.call(server, {:get_build_jobs, build_id})
    end
  end

  defmodule Builds do
    @moduledoc """
      Set of functions for getting builds information.
    """

    @doc """
      Gets list of build for an authenticated user

          iex> Sauce.Builds.get_build_jobs(server_pid, "build-id")
    """
    @spec get(pid()) :: map()
    def get(server) do
      GenServer.call(server, {:get_builds})
    end
  end

  defmodule Metrics do
    @moduledoc """
      Set of functions for getting performance metrics information.
    """

    @doc """
      Gets performance metrics for a given `job_id`

          iex> Sauce.Metrics.get(server_pid, job_id)
    """
    @spec get(pid(), charlist()) :: map()
    def get(server, job_id) do
      GenServer.call(server, {:get_metrics, job_id})
    end

    @doc """
      Gets baseline history for a given `job_id`

          iex> Sauce.Metrics.get_baseline_history(server_pid, job_id)
    """
    @spec get_baseline_history(pid(), charlist()) :: map()
    def get_baseline_history(server, job_id) do
      GenServer.call(server, {:get_metrics_baseline_history, job_id})
    end
  end

  def init(init_arg) do
    {:ok, init_arg}
  end
end
