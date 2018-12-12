#Defining the protocol
defprotocol Blank do
   def blank?(data)
end

#Implementing the protocol for lists
defimpl Blank, for: List do
   def blank?([]), do: true
   def blank?(_), do: false
end

#Implementing the protocol for strings
defimpl Blank, for: BitString do
   def blank?(""), do: true
   def blank?(_), do: false
end

#Implementing the protocol for maps
defimpl Blank, for: Map do
   def blank?(map), do: map_size(map) == 0
end


defimpl Blank, for:  Integer do
  def blank?(0), do: nil
  def blank?(_), do: false
end

IO.puts(Blank.blank? [])
IO.puts(Blank.blank? [:true, "Hello"])
IO.puts(Blank.blank? "")
IO.puts(Blank.blank? "Hi")
IO.puts(Blank.blank? 2)