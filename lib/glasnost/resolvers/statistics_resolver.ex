defmodule Glasnost.StatisticsResolver do
  alias Glasnost.Repo
  import Ecto.Query
  import Glasnost.ResolverUtils, only: [select_schema: 2]

  def all(%{blockchain: blockchain}, _info) do
    {:ok, %{
      post_count: Repo.count(from c in schema, where: is_nil(c.parent_author)),
      comment_count: Repo.count(from c in schema, where: not is_nil(c.parent_author)),
      authors_count: Repo.count(from c in schema, distinct: c.author),
    }}
  end

end
