defmodule BowersSdk.Me.AccountTest do
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

  test "create an unlinked account" do
    HTTPClientMock
    |> expect(:post, fn "http://me.bowers.dev", "/account", %{} ->
      @valid_response
    end)

    create_account(%{}, host: @me_host)
  end
end
