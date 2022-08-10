defmodule Financer.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table("despesas") do
      add :descricao, :string
      add :valor, :float
      add :data, :utc_datetime
      timestamps()
    end

  end
end
