defmodule BowersSdk.Me.RoleTest do
  use ExUnit.Case
  alias BowersSdk.HTTPClientMock
  alias BowersSdk.Me.Role

  use Support.TestHelper, :mox

  test "validate/1" do
    HTTPClientMock
    |> expect(:post, fn _host, "/role/validate", %{token: "abc123"} ->
      @valid_response
    end)

    Role.validate(%{
      token: "abc123"
    })
  end
end
