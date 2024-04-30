defmodule Vachan.Repo.Migrations.MigrateResources5 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create unique_index(:sender_profiles, [:organization_id, :title],
             name: "sender_profiles_unique_name_index"
           )
  end

  def down do
    drop_if_exists unique_index(:sender_profiles, [:organization_id, :title],
                     name: "sender_profiles_unique_name_index"
                   )
  end
end