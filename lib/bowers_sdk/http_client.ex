defmodule BowersSdk.HTTPClient do
  @callback get(String.t(), String.t()) :: {number(), map()}
  @callback post(String.t(), String.t(), map()) :: {number(), map()}

  def get(host, path) do
    HTTPoison.get("#{host}#{path}")
  end

  def post(host, path, payload) do
    HTTPoison.post("#{host}#{path}", Jason.encode(payload))
  end
end
