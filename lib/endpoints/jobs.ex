defmodule Endpoints.Jobs do
  def get(id) do
    %{
      :url => "/rest/v1.1/jobs/#{id}",
      :method => :GET
    }
  end

  def get_user_jobs(username) do
    %{
      :url => "/rest/v1.1/#{username}/jobs",
      :method => :GET
    }
  end

end
