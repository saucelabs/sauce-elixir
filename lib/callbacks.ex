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

  def handle_call({:list, options}, _from, credentials) do
    get_username(credentials, options)
      |> Endpoints.Jobs.list
      |> request_call(credentials, options)
  end

  def handle_call({:get_build_failed_jobs, build_id, options}, _from, credentials) do
    get_username(credentials, options)
      |> Endpoints.Jobs.get_build_failed_jobs(build_id)
      |> request_call(credentials)
  end

  def handle_call({:get_build_jobs, build_id}, _from, credentials) do
    Endpoints.Jobs.get_build_jobs(build_id)
      |> request_call(credentials)
  end

  def handle_call({:get_job_assets, job_id, options}, _from, credentials) do
    get_username(credentials, options)
      |> Endpoints.Jobs.get_job_assets(job_id)
      |> request_call(credentials)
  end

  def handle_call({:get_job_asset_file, job_id, file_name, options}, _form, credentials) do
    get_username(credentials, options)
      |> Endpoints.Jobs.get_job_asset_file(job_id, file_name)
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

  defp get_username(credentials, options) do
    options[:username] || credentials[:username]
  end
end
