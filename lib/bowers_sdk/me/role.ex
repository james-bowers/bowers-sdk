defmodule BowersSdk.Me.Role do
  alias BowersSdk.Hosts
  @http_client Application.get_env(:bowers_sdk, :http_client, BowersSdk.HttpClient)

  def validate(values = %{token: _token}) do
    @http_client.post(Hosts.me(), "/role/validate", values)
  end
end
