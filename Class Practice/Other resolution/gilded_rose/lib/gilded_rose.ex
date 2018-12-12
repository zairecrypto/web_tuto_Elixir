defmodule GildedRose do
  def update_quality([item|items]) do
    updated_item = item |> update_sell_in |> update_quality

    [updated_item|update_quality(items)]
  end

  def update_quality([]), do: []

  def update_quality(%{name: "Sulfuras"<>_} = item), do: item
  def update_quality(%{name: "Aged Brie"<>_} = item), do: increase_quality(item)

  def update_quality(%{name: "Backstage"<>_, sell_in: sell_in} = item) when sell_in <= 0 do
    %{item | quality: 0}
  end

  def update_quality(%{name: "Backstage"<>_, sell_in: sell_in} = item) when sell_in <= 5 do
    item |> increase_quality |> increase_quality |> increase_quality
  end

  def update_quality(%{name: "Backstage"<>_, sell_in: sell_in} = item) when sell_in <= 10 do
    item |> increase_quality |> increase_quality
  end

  def update_quality(%{name: "Backstage"<>_, sell_in: sell_in} = item) when sell_in > 10 do
    item |> increase_quality
  end

  def update_quality(%{name: "Conjured"<>_, sell_in: sell_in} = item) when sell_in > 0 do
    item |> decrease_quality |> decrease_quality
  end

  def update_quality(%{name: "Conjured"<>_, sell_in: sell_in} = item) when sell_in <= 0 do
    item |> decrease_quality |> decrease_quality |> decrease_quality |> decrease_quality
  end

  def update_quality(%{sell_in: sell_in} = item) when sell_in < 0, do: item |> decrease_quality |> decrease_quality
  def update_quality(item), do: decrease_quality(item)

  ###

  def increase_quality(%{quality: quality} = item) when quality == 50, do: item
  def increase_quality(item), do: %{item | quality: item.quality + 1}

  def decrease_quality(%{quality: quality} = item) when quality == 0, do: item
  def decrease_quality(item), do: %{item | quality: item.quality - 1}

  def update_sell_in(%{name: "Sulfuras"<>_} = item), do: item
  def update_sell_in(item), do: %{item | sell_in: item.sell_in - 1}

end
