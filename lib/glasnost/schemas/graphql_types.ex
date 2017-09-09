defmodule Glasnost.Schema.Types do
  use Absinthe.Schema.Notation

  scalar :naive_datetime, description: "ISOz time" do
    parse &NaiveDateTime.from_iso8601!/1
    serialize &NaiveDateTime.to_string/1
  end

  object :comment do
    field :id, :integer
    field :author, :string
    field :permlink, :string
    field :parent_author, :string
    field :parent_permlink, :string
    field :title, :string
    field :body, :string
    field :body_html, :string
    field :tags, %Absinthe.Type.List{of_type: :string}
    field :category, :string
    field :created, :naive_datetime
    field :total_payout_value, :float
    field :pending_payout_value, :float
  end

  object :statistic do
    field :count, :integer
  end

end
