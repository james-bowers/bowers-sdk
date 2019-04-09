defmodule BowersSdk.Me do
  @http_client Application.get_env(:bowers_sdk, :http_client, BowersSdk.HTTPClient)

  @callback create_person(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()
  @callback validate_role(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()
  @callback create_account(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()
  @callback list_roles(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()
  @callback create_role(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()

  def create_account(values, host: host) when is_map(values) do
    @http_client.post(host, "/account", values)
  end

  def create_person(values, host: host) when is_map(values) do
    @http_client.post(host, "/person/sign-up", values)
  end

  def validate_role(values = %{token: _token}, host: host) do
    @http_client.post(host, "/role/validate", values)
  end

  def list_roles(%{person: person_id}, host: host) do
    @http_client.get(host, "/role/list-by-person/#{person_id}")
  end

  def create_role(values = %{account_id: _, person_id: _}, host: host) do
    @http_client.post(host, "/role/link", values)
  end
end
