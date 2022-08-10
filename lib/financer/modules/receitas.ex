defmodule Financer.Receitas do
  alias Financer.Repo
  import Ecto.Changeset
  use Ecto.Schema

  schema "receitas" do
    field :descricao, :string
    field :valor, :float
    field :data, :utc_datetime
    timestamps()
  end

  defp changeset(%__MODULE__{} = ch, attrs) do
    ch
    |> cast(attrs, [:descricao, :valor, :data])
  end

  def insert(attrs \\ %{}) do
  %Financer.Receitas{data:  DateTime.truncate(DateTime.utc_now, :second)}
  |> changeset(attrs)
  |> Repo.insert()
  end

  def get_all(), do: Repo.all(Financer.Receitas)
  def get_by_id(id), do: Repo.get(Financer.Receitas, id)
  def exist?(query), do: Repo.exists?(query)

  def update(id, data) do
    get_by_id(id)
    |> changeset(data)
    |> Repo.update()
  end

  def delete(id) do
    get_by_id(id)
    |>case do
      nil -> %{error: "Receita inixistente"}
      %Financer.Receitas{} -> get_by_id(id)
                              |>Repo.delete
            end

  end


end

