defmodule BowersSdk.HTTPClient do
  @type response :: %{content: map(), description: String.t()}
  @callback get(String.t(), String.t()) :: response
  @callback post(String.t(), String.t(), map()) :: response

  def get(host, path) do
    HTTPoison.get("#{host}#{path}")
    |> format_response()
  end

  def post(host, path, payload) do
    HTTPoison.post("#{host}#{path}", Jason.encode(payload))
    |> format_response()
  end

  defp format_response(%HTTPoison.Response{status_code: status, body: body}) do
    {status, Jason.decode!(body)}
  end
end
