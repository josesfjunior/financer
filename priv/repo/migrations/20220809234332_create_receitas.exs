defmodule Financer.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table("receitas") do
      add :descricao, :string
      add :valor, :float
      add :data, :utc_datetime
      timestamps()
    end
  end
end
