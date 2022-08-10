defmodule FinancerWeb.DespesasController do
  use FinancerWeb, :controller
  alias Financer.Despesas
  import Ecto.Query

  def get_all(conn, _) do
    lista = Despesas.get_all()
    resp(conn, :ok, JSON.encode!(lista))
  end

  def get_by_id(conn, %{"id" => id}) do
    retorno = Despesas.get_by_id(id)
    resp(conn, :ok, JSON.encode!(retorno))
  end

  def post(conn,  %{"descricao" => descricao,"valor"=> valor} = _param) do
    Despesas.exist?( from(r in "despesas", where: r.descricao == ^descricao and r.valor == ^valor))
    |> case do
         false ->  Despesas.insert(%{descricao: descricao, valor: valor})
                   |> case  do
                        {:ok, _} -> resp(conn, :ok, "inserido")
                        {:error, _} -> resp(conn, :ok, "Error")
                      end
         _ -> resp(conn, :ok, "Dados já constam na base")
       end
  end

  def update(conn,  %{"id" => id,"descricao" => descricao,"valor"=> valor} = _param) do
    Despesas.exist?( from r in "despesas", where: r.descricao == ^descricao and r.valor == ^valor )
    |> case do
         false ->  Despesas.update(id, %{descricao: descricao, valor: valor})
                   |> case  do
                        {:ok, _} -> resp(conn, :ok, "atualizado")
                        {:error, _} -> resp(conn, :ok, "Error")
                      end
         _ -> resp(conn, :ok, "Dados já constam na base")
       end
  end

  def delete(conn, %{"id" => id} = _params) do
    Despesas.delete(id)
    |> case  do
         {:ok, _} -> resp(conn, :ok, "deletado")
         %{error: error} -> resp(conn, :ok, error)
       end
  end
end



