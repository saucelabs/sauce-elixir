defmodule Callbacks do
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

  def handle_call({:get_user_jobs, username}, _from, credentials) do
    endpoint = Endpoints.Jobs.get_user_jobs(username)
    response = Requester.call(endpoint[:method], endpoint[:url], credentials)
    {:reply, response, credentials}
  end

  def handle_call({:get_build_jobs, build_id}, _from, credentials) do
    endpoint = Endpoints.Jobs.get_build_jobs(build_id)
    response = Requester.call(endpoint[:method], endpoint[:url], credentials)
    {:reply, response, credentials}
  end
end
