defmodule BowersSdk.HTTPClientMock do
  alias BowersSdk.HTTPClient
  @behaviour HTTPClient

  @impl HTTPClient
  def get(_host, _path), do: {200, %{}}

  @impl HTTPClient
  def post(_host, _path, _payload), do: {200, %{}}
end
