defmodule Endpoints.Jobs do
  @moduledoc false

  def get(id) do
    %{
      :url => "/rest/v1.1/jobs/#{id}",
      :method => :GET
    }
  end

  def list(username) do
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

  def get_build_failed_jobs(username, build_id) do
    %{
      :url => "/rest/v1/#{username}/builds/#{build_id}/failed-jobs",
      :method => :GET
    }
  end

  def get_job_assets(username, job_id) do
    %{
      :url => "/rest/v1/#{username}/jobs/#{job_id}/assets",
      :method => :GET
    }
  end

  def get_job_asset_file(username, job_id, file_name) do
    %{
      :url => "/rest/v1/#{username}/jobs/#{job_id}/assets/#{file_name}",
      :method => :GET
    }
  end

  def delete(username, job_id) do
    %{
      :url => "/rest/v1/#{username}/jobs/#{job_id}",
      :method => :DELETE
    }
  end
end
