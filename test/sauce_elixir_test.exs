defmodule SauceElixirTest do
  use ExUnit.Case

  setup do
    bypass = Bypass.open()
    {:ok, server_pid} = Sauce.start("username", "access_key", "http://localhost:#{bypass.port}")
    {:ok, bypass: bypass, server_pid: server_pid}
  end

  test "get job by id responds with Http 200", %{bypass: bypass, server_pid: server_pid} do
    Bypass.expect(
      bypass,
      fn conn ->
        assert "GET" == conn.method
        assert "/rest/v1.1/jobs/12345" == conn.request_path
        Plug.Conn.resp(
          conn,
          200,
          "{\"job_details\": \"details\"}"
        )
      end
    )
    assert {:ok, %{"job_details" => "details"}} = Sauce.Jobs.get(server_pid, "12345")
  end
end
