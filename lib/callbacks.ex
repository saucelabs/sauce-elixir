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
end
