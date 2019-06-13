defmodule Callbacks do
  @moduledoc false

  def init([username, access_key, base_url]) do
    credentials = %{
      :username => username,
      :access_key => access_key,
      :base_url => base_url
    }

    {:ok, credentials}
  end

  def handle_call({:get_job, job_id}, _from, credentials) do
    Endpoints.Jobs.get(job_id)
      |> request_call(credentials)
  end

  def handle_call({:get_user_jobs, username, options}, _from, credentials) do
    Endpoints.Jobs.get_user_jobs(username)
      |> request_call(credentials, options)
  end

  def handle_call({:get_user_build_failed_jobs, username, build_id}, _from, credentials) do
    Endpoints.Jobs.get_user_build_failed_jobs(username, build_id)
      |> request_call(credentials)
  end

  def handle_call({:get_build_jobs, build_id}, _from, credentials) do
    Endpoints.Jobs.get_build_jobs(build_id)
      |> request_call(credentials)
  end

  def handle_call({:get_builds}, _from, credentials) do
    Endpoints.Builds.get()
      |> request_call(credentials)
  end

  def handle_call({:get_metrics, job_id}, _from, credentials) do
    Endpoints.Metrics.get(job_id)
      |> request_call(credentials)
  end

  def handle_call({:get_metrics_baseline_history, job_id}, _from, credentials) do
    Endpoints.Metrics.get_baseline_history(job_id)
      |> request_call(credentials)
  end

  defp request_call(endpoint, credentials, options \\ []) do
    response = Requester.call(endpoint[:method], endpoint[:url], credentials, options)
    {:reply, response, credentials}
  end
end
