defmodule BowersSdk.Me.PersonTest do
  use ExUnit.Case
  alias BowersSdk.HTTPClientMock
  alias BowersSdk.Me.Person

  use Support.TestHelper, :mox

  @valid_response %HTTPoison.Response{
    body: ~s({}),
    headers: [{"Content-Type", "application/json"}],
    status_code: 200
  }

  test "create an anonymous user" do
    HTTPClientMock
    |> expect(:post, fn _host, "/person/sign-up", %{} ->
      @valid_response
    end)

    Person.create()
  end

  test "create an identifiable user" do
    HTTPClientMock
    |> expect(:post, fn _host,
                        "/person/sign-up",
                        %{email: "tester@bowers.dev", password: "pass"} ->
      @valid_response
    end)

    Person.create(%{email: "tester@bowers.dev", password: "pass"})
  end
end
