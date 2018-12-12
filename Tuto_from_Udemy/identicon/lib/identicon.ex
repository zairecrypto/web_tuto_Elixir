defmodule Identicon do
  @moduledoc """
    Module to create an Identicon
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  @doc """
    To hash a string using MD5 crypto
    argument: string
    Return  : defstruct Identicon.Image

  ## Examples

      iex> image = Identicon.hash_input "Black Paenther"
      %Identicon.Image{
        color: nil,
        grid: nil,
        hex: [112, 107, 203, 118, 126, 3, 85, 128, 163, 144, 8, 11, 211, 65, 194, 157],
        pixel_map: nil
      }
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list    
    %Identicon.Image{hex: hex}
  end

  @doc """    
    To select a rgb color from each value of hex; in
    argument: defstruct Identicon.Image
    Return  : defstruct Identicon.Image

  ## Example

      iex> image = Identicon.hash_input "Black Paenther"
      iex> Identicon.pick_color image
      %Identicon.Image{
        color: {112, 107, 203},
        grid: nil,
        hex: [112, 107, 203, 118, 126, 3, 85, 128, 163, 144, 8, 11, 211, 65, 194, 157],
        pixel_map: nil
      }    
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do    
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
    To build a grip of 5 x 5 from hex: list
    argument: list 
    Return  : defstruct Identicon.Image
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = 
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row([first, second | _tail] = row) do    
    row ++ [second, first]
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _idx}) ->  
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end

  def build_pixel_map (%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal   = rem(index, 5) * 50
      vertical     = div(index, 5) * 50
      top_left     = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}
      {top_left, bottom_right}
    end
    
    %Identicon.Image{image | pixel_map: pixel_map}

  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill  = :egd.color(color)
    
    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop,fill)
    end

    :egd.render(image)
  end

  def save_image(image, input) do
    File.write("identicon_#{input}.png", image)
  end
end
