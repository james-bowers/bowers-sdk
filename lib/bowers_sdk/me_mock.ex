defmodule BowersSdk.MeMock do
  alias BowersSdk.Me
  @behaviour Me

  @impl Me
  def create_person(_values, _opts), do: {200, %{}}

  @impl Me
  def validate_role(_values, _opts), do: {200, %{}}

  @impl Me
  def create_account(_values, _opts), do: {200, %{}}
end
