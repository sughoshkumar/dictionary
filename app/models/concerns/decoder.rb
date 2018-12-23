module Decoder
  
  @@dictionary = File.readlines('./dictionary.txt').map{|w| w.strip}

  class << self

    def word_exists(word)
      w = @@dictionary.bsearch{|x| x>= word }
      w == word
    end

    def combinations(data)
      hash_data = { 2 => %w(a b c), 3 => %w(d e f), 4 => %w(g h i), 5 => %w(j k l), 6 => %w(m n o), 7 => %w(p q r s), 8 => %w(t u v), 9 => %w(w x y z) }
      total_combinations = nil
      data.each_char do |n|
        codes = hash_data[n.to_i]
        puts "codes=#{codes}"
        if total_combinations
          total_combinations = total_combinations.product(codes)
        else
          total_combinations = codes
        end
      end
      test_words = total_combinations.map { |e| e.flatten().join}
      test_words.select! { |w| word_exists(w.upcase) }
      test_words
    end

    def converter(data)
      start_letter = ""
      all_words = combinations(data)
      full_words = all_words
      puts "full_words: #{full_words}"
      while data.length>3 do
        start_letter += data.slice!(0)
        next if start_letter.length < 3
        puts "start_letter: #{start_letter}"
        puts "data: #{data}"
        first_words = combinations(start_letter)
        last_words = combinations(data)
        puts "first_words: #{first_words}"
        puts "last_words: #{last_words}"
        if first_words.length>0 && last_words.length>0 
          total_combinations = first_words.product(last_words)
          all_words += total_combinations
        end
      end
      all_words
    end

  end

end

