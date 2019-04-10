defmodule BowersSdk.MeReturn do
  @moduledoc """
  Build valid returns from Me services
  for use in "business" logic tests.
  """
  @fake_data [
    person_id: "c6d771c9-debe-4276-bd32-d2ca2b2c394f",
    account_id: "d75a9cd2-acec-46be-81e7-84a786971d44",
    role_id: "f8c8a516-ad0a-4409-aca1-40c74b48d81a",
    person_id: "c6d771c9-debe-4276-bd32-d2ca2b2c394f"
  ]

  def fake_data(id) when is_atom(id) do
    Keyword.fetch!(@fake_data, id)
  end

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

  def reply_to(:create_person), do: %{}

  def reply_to(:validate_role),
    do: %{
      "description" => "Role validated",
      "content" => %{
        "role" => %{
          "person_id" => fake_data(:person_id),
          "id" => fake_data(:role_id),
          "account_id" => fake_data(:account_id)
        },
        "person" => %{
          "last_name" => "Bowers",
          "id" => fake_data(:person_id),
          "first_name" => "James"
        },
        "email" => ["james@bowers.dev"],
        "account" => %{
          "id" => fake_data(:account_id),
          "active" => 1
        }
      }
    }

  def reply_to(:create_role),
    do: %{
      "description" => "Account linked to person"
    }

  def reply_to(:list_roles),
    do: %{
      "content" => %{
        "roles" => [
          %{
            "account_id" => fake_data(:account_id),
            "id" => fake_data(:role_id),
            "person_id" => fake_data(:person_id)
          }
        ]
      },
      "description" => "Listing roles for the given user"
    }
end
