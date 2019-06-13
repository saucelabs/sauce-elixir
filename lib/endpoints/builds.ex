defmodule Endpoints.Builds do
  @moduledoc false

  def get() do
    %{
      :url => "/rest/v1.1/builds",
      :method => :GET
    }
  end
end
