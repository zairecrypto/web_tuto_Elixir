
defmodule Hangman do


# iex(3)> c "lib/test/hangman.ex"
# iex(4)> Hangman.unic_letters "Hangman"
    def unic_letters(secretword) do
        secretword 
        |> String.graphemes
        |> MapSet.new
    end

# Hangman.format_feedback/1 
#   Tuple state_of_a_game - > {secretword, correct_guesses, wrong_guesses, remaining_turns}
#   generates a string with the feedback for the player (e.g. “-a—a-”).

# iex(45)> Hangman.feedback_interface({"Hangman", "aaa", "qsdqs", 4})

    def format_feedback(
        {secretword, correct_guesses, _wrong_guesses, _remaining_turns} = _state_of_a_game
        ) do
           
        c_guess = correct_guesses
                    |> String.graphemes
                    |> MapSet.new
        unic = unic_letters(secretword)
        cond do
            MapSet.disjoint?(unic, c_guess) -> lst_of_guess = unic |> MapSet.to_list
            feedbck_string = String.replace(secretword, lst_of_guess, "_")
            IO.puts feedbck_string
        
            true ->
                ms_guess = MapSet.difference(unic, c_guess)
                if MapSet.size(ms_guess) > 0 do
                    lst_of_guess = MapSet.to_list(ms_guess)
                    feedbck_string = String.replace(secretword, lst_of_guess, "_")
                    feedbck_string
                else
                    "ERROR"
                end
        end
      end


# Hangman.score_guess/2 : 
#   tuple state_of_a_game -> {secretword, correct_guesses, wrong_guesses, remaining_turns}
#   letter (player_guess) 
#   and returns state_of_a_game after taking into account the guess.

    def score_guess(
        {secretword, correct_guesses, wrong_guesses, remaining_turns} = state_of_a_game, 
        player_guess
        ) do

        
    end


    def score(remaining_chances, keyword, right_guesses) do
        keyword = String.upcase(keyword)
        feedback_interface(remaining_chances, keyword, right_guesses)
        cond do
          MapSet.equal?(right_guesses, keyword_letters(keyword)) ->
            IO.puts "Really? gratz bro!"
    
          true ->
            guess = String.strip(IO.gets "chuta aí ")
                      |> String.upcase
            if MapSet.member?(keyword_letters(keyword), guess) do
              IO.puts "You guessed it right, mizeráavi!"
              game2(remaining_chances, keyword, MapSet.put(right_guesses, guess))
            else
              IO.puts "Oops, best luck next time!"
              game2((remaining_chances - 1), keyword, right_guesses)
            end
        end
      end


end