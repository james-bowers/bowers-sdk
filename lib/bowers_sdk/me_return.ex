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

  def reply_to(:list_roles, _opts),
    do: %{
      "content" => %{
        "roles" => [
          %{
            "account_id" => "d75a9cd2-acec-46be-81e7-84a786971d44",
            "id" => "f8c8a516-ad0a-4409-aca1-40c74b48d81a",
            "person_id" => "c6d771c9-debe-4276-bd32-d2ca2b2c394f"
          }
        ]
      },
      "description" => "Listing roles for the given user"
    }
end
