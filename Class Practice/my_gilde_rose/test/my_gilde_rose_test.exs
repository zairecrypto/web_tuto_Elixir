defmodule MyGildeRoseTest do
  use ExUnit.Case

  test "At the end of each day our system lowers both values for every item" do
    item = %Item{name: "+5 Dexterity Vest", sell_in: 10, quality: 20}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality - 1
  end

  test "Once the sell by date has passed, Quality degrades twice as fast" do
    item = %Item{name: "+5 Dexterity Vest", sell_in: -5, quality: 20}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality - 2
  end

  test "The Quality of an item is never negative" do
    item = %Item{name: "+5 Dexterity Vest", sell_in: -5, quality: 0}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality
  end

  test "“Aged Brie” actually increases in Quality the older it gets" do
    item = %Item{name: "Aged Brie", sell_in: 10, quality: 10}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality + 1
  end

  test "The Quality of an item is never more than 50" do
    item = %Item{name: "Aged Brie", sell_in: 10, quality: 50}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality
  end

  test "“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality" do
    item = %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 50}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.sell_in == item.sell_in
    assert updated_item.quality == item.quality
  end

  test "“Backstage passes”, increases in Quality as it’s SellIn value approaches" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 15, quality: 10}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality + 1
  end

  test "“Backstage passes” Quality increases by 2 when there are 10 days or less" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 10}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality + 2
  end

  test "“Backstage passes” Quality increases by 3 when there are 5 days or less" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 10}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == item.quality + 3
  end

  test "“Backstage passes” Quality drops to 0 after the concert" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 10}
    [updated_item] = GildedRose.update_quality([item])
    assert updated_item.quality == 0
  end

  # test "Conjured Mana Cake sell in greater than 0" do
  #   item = %Item{name: "Conjured Mana Cake", sell_in: 3, quality: 6}
  #   [updated_item] = GildedRose.update_quality([item])
  #   assert updated_item.quality == item.quality - 2
  # end

  # test "Conjured Mana Cake sell in less than 0" do
  #   item = %Item{name: "Conjured Mana Cake", sell_in: -1, quality: 6}
  #   [updated_item] = GildedRose.update_quality([item])
  #   assert updated_item.quality == item.quality - 4
  # end

end
