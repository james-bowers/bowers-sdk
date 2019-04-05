defmodule BowersSdk.Me.Person do
  alias BowersSdk.Hosts
  @http_client Application.get_env(:bowers_sdk, :http_client, BowersSdk.HttpClient)

  def create(values \\ %{}) do
    @http_client.post(Hosts.me(), "/person/sign-up", values)
  end
end
