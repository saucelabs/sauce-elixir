defmodule Endpoints.Jobs do

    def get(id) do
        %{
            :url => "/rest/v1.1/jobs/#{id}",
            :method => :GET
        }
    end

end
