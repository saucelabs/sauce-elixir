defmodule SauceElixirTest do
  use ExUnit.Case

  setup do
    bypass = Bypass.open()
    :ok = Sauce.start("username", "access_key", "http://localhost:#{bypass.port}")
    {:ok, bypass: bypass}
  end

  test "get job by id responds with Http 200", %{bypass: bypass} do
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

    assert {:ok, %{"job_details" => "details"}} = Sauce.Jobs.get("12345")
  end

  test "get jobs by build id responds with Http 200", %{bypass: bypass} do
    Bypass.expect(
      bypass,
      fn conn ->
        assert "GET" == conn.method
        assert "/rest/v1/builds/12345/jobs" == conn.request_path

        Plug.Conn.resp(
          conn,
          200,
          "{\"jobs\": []}"
        )
      end
    )

    assert {:ok, %{"jobs" => []}} = Sauce.Jobs.get_build_jobs("12345")
  end

  test "get builds failed jobs", %{bypass: bypass} do
    Bypass.expect(
      bypass,
      fn conn ->
        assert "GET" == conn.method
        assert "/rest/v1/fake-username/builds/fake-build-id/failed-jobs" == conn.request_path

        Plug.Conn.resp(
          conn,
          200,
          "{\"jobs\": []}"
        )
      end
    )

    assert {:ok, %{"jobs" => []}} =
             Sauce.Jobs.get_build_failed_jobs("fake-build-id", username: "fake-username")
  end

  test "list user builds", %{bypass: bypass} do
    Bypass.expect(
      bypass,
      fn conn ->
        assert "GET" == conn.method
        assert "/rest/v1.1/builds" == conn.request_path

        Plug.Conn.resp(
          conn,
          200,
          "{\"builds\": []}"
        )
      end
    )

    assert {:ok, %{"builds" => []}} = Sauce.Builds.get()
  end

  test "get metrics by job id responds with Http 200", %{bypass: bypass} do
    Bypass.expect(
      bypass,
      fn conn ->
        assert "GET" == conn.method
        assert "/rest/v1/performance/metrics/12345" == conn.request_path

        Plug.Conn.resp(
          conn,
          200,
          "{\"metrics\": []}"
        )
      end
    )

    assert {:ok, %{"metrics" => []}} = Sauce.Metrics.get("12345")
  end

  test "get metrics baseline history by job id responds with Http 200", %{bypass: bypass} do
    Bypass.expect(
      bypass,
      fn conn ->
        assert "GET" == conn.method
        assert "/rest/v1/performance/metrics/12345/baseline/history" == conn.request_path

        Plug.Conn.resp(
          conn,
          200,
          "{\"history\": []}"
        )
      end
    )

    assert {:ok, %{"history" => []}} = Sauce.Metrics.get_baseline_history("12345")
  end
end
