defmodule BowersSdk.Me do  
  @http_client Application.get_env(:bowers_sdk, :http_client, BowersSdk.HTTPClient)
  
  @callback create_person(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()
  @callback validate_role(map(), BowersSdk.opts()) :: BowersSdk.HTTPClient.response()

  def create_person(values, [host: host]) when is_map(values) do
    @http_client.post(host, "/person/sign-up", values)
  end

  def validate_role(values = %{token: _token}, [host: host]) do
    @http_client.post(host, "/role/validate", values)
  end
end