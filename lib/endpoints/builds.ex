defmodule Endpoints.Builds do
  def get() do
    %{
      :url => "/rest/v1.1/builds",
      :method => :GET
    }
  end
end
