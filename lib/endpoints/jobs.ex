defmodule Endpoints.Jobs do
  @moduledoc false

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

  def get_build_jobs(build_id) do
    %{
      :url => "/rest/v1/builds/#{build_id}/jobs",
      :method => :GET
    }
  end

  def get_user_build_failed_jobs(username, build_id) do
    %{
      :url => "/rest/v1/#{username}/builds/#{build_id}/failed-jobs",
      :method => :GET
    }
  end
end
