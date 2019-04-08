defmodule BowersSdk.MeReturn do
  @moduledoc """
  Build valid returns from Me services
  for use in "business" logic tests.
  """

  def build_id, do: Ecto.UUID.generate()

  def reply_to(:create_account),
    do: %{
      "content" => %{
        "account" => %{
          "id" => build_id(),
          "active" => 1
        }
      }
    }

  def reply_to(:create_person, _opts), do: %{}

  def reply_to(:validate_role, _opts), do: %{}
end
