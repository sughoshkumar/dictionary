module Decoder
  
   class << self

    def converter(data)
      start_letter = ""
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
      total_combinations = total_combinations.map { |e| e.flatten().join}
      puts "total_combinations: #{total_combinations}"
      total_combinations
    end

  end

end

