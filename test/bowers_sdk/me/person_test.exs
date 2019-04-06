defmodule BowersSdk.Me.PersonTest do
  use ExUnit.Case
  alias BowersSdk.HTTPClientMock
  
  import BowersSdk.Me

  use Support.TestHelper, :mox

  @me_host "http://me.bowers.dev"

  @valid_response %HTTPoison.Response{
    body: ~s({}),
    headers: [{"Content-Type", "application/json"}],
    status_code: 200
  }

  test "create an anonymous user" do
    HTTPClientMock
    |> expect(:post, fn "http://me.bowers.dev", "/person/sign-up", %{} ->
      @valid_response
    end)

    create_person(%{}, host: @me_host)
  end

  test "create an identifiable user" do
    HTTPClientMock
    |> expect(:post, fn _host,
                        "/person/sign-up",
                        %{email: "tester@bowers.dev", password: "pass"} ->
      @valid_response
    end)

    create_person(%{email: "tester@bowers.dev", password: "pass"}, host: @me_host)
  end
end
