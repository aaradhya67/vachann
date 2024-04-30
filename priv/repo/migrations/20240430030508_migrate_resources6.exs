defmodule Vachan.Repo.Migrations.MigrateResources6 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    drop constraint(:crm_people_lists, "crm_people_lists_list_id_fkey")

    drop constraint(:crm_people_lists, "crm_people_lists_person_id_fkey")

    alter table(:crm_people_lists) do
      modify :person_id,
             references(:people,
               column: :id,
               name: "crm_people_lists_person_id_fkey",
               type: :uuid,
               prefix: "public",
               on_delete: :delete_all
             )
    end

    execute(
      "ALTER TABLE crm_people_lists alter CONSTRAINT crm_people_lists_person_id_fkey NOT DEFERRABLE"
    )

    alter table(:crm_people_lists) do
      modify :list_id,
             references(:crm_lists,
               column: :id,
               name: "crm_people_lists_list_id_fkey",
               type: :bigint,
               prefix: "public",
               on_delete: :delete_all
             )
    end

    execute(
      "ALTER TABLE crm_people_lists alter CONSTRAINT crm_people_lists_list_id_fkey NOT DEFERRABLE"
    )
  end

  def down do
    drop constraint(:crm_people_lists, "crm_people_lists_list_id_fkey")

    alter table(:crm_people_lists) do
      modify :list_id,
             references(:crm_lists,
               column: :id,
               name: "crm_people_lists_list_id_fkey",
               type: :bigint,
               prefix: "public"
             )
    end

    drop constraint(:crm_people_lists, "crm_people_lists_person_id_fkey")

    alter table(:crm_people_lists) do
      modify :person_id,
             references(:people,
               column: :id,
               name: "crm_people_lists_person_id_fkey",
               type: :uuid,
               prefix: "public"
             )
    end
  end
end