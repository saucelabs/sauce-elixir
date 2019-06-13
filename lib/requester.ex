defmodule Requester do
	defp build_headers(credentials) do
		basic_auth = "#{credentials[:username]}:#{credentials[:access_key]}" |> Base.encode64()
    	headers = [{"Content-Type", "application/json"}, {"Authorization", "Basic #{basic_auth}"}]
		{:ok, headers}
	end

	def call(:GET, url, credentials) do
		{:ok, headers} = build_headers(credentials)
		url = "#{credentials[:base_url]}#{url}"
	    case HTTPoison.get(url, headers) do
				{:ok, %{body: raw_body}} ->
					Poison.Parser.parse(raw_body, Map.new())
	      {:error, reason} -> {:error, reason}
	    end
	end

end
