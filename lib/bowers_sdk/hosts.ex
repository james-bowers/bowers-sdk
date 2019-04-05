defmodule BowersSdk.Hosts do
  def me do
    "http://localhost"
    # Application.fetch_env!(:bowers_sdk, :me_host)
  end
end
