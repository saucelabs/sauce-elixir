defmodule Endpoints.Metrics do
    def get(job_id) do
      %{
        :url => "/rest/v1/performance/metrics/#{job_id}",
        :method => :GET
      }
    end

    def get_baseline_history(job_id) do
        %{
          :url => "/rest/v1/performance/metrics/#{job_id}/baseline/history",
          :method => :GET
        }
      end
  end
