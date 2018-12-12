defmodule Cards do
  @moduledoc """
    provides methodes for creating and handeling a deck of cards
  """

  @doc """
    return a list of strings of 20 elements representing a deck

  ## Examples

      iex> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamond",
      "Two of Diamond", "Three of Diamond", "Four of Diamond", "Five of Diamond"]      
  """
  def create_deck do 
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits  = ["Spades", "Clubs", "Hearts", "Diamond"]

# to iterate over a list, we use List Comprehension

  # BAD Approach{

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten cards
  # }

  # GOOD Approach{
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  # }
  
  end


  @doc """
    Shuffles elements of a list
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contrains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Four of Hearts")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` arguments indicates how many cards should be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> hand = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]   
    
  """
  def deal(deck, hand_size) do
    {hand, _} = Enum.split(deck, hand_size)
    hand
  end

  @doc """
    Saves the create deck into a local file passed in argument

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do
  # FIRST Approach{
    # {status, binary} = 
    
    # case status do
    #   :ok    -> :erlang.binary_to_term(binary)
    #   :error -> "File does not exist"
    # end    
  # }
  # SECOND Approach{
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _}   -> "File does not exist"        
    end
  # }
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end