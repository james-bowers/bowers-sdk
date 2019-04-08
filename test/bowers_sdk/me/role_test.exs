defmodule BowersSdk.Me.RoleTest do
  use ExUnit.Case
  alias BowersSdk.HTTPClientMock
  alias BowersSdk.Me
  @me_host "http://me.bowers.dev"

  use Support.TestHelper, :mox

  @valid_response {200, %{"content" => %{}, "description" => ""}}

  test "validate/1" do
    HTTPClientMock
    |> expect(:post, fn "http://me.bowers.dev", "/role/validate", %{token: "abc123"} ->
      @valid_response
    end)

    Me.validate_role(
      %{
        token: "abc123"
      },
      host: @me_host
    )
  end
end
