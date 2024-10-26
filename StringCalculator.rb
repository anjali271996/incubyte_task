class StringCalculator
  def self.string_calc(numbers)
    if numbers.is_a?(String)
      if numbers == "" || numbers.empty?
        return 0
      end
      if numbers.match?(/[,;\n]/)
        begin
          numbers = numbers.split(/[,;\n]+/)
          if numbers.any? { |num| num.strip.match?(/-\d+/) }
            raise NegativeIntegerError
          else
            return numbers.map(&:to_i).sum
          end
        rescue NegativeIntegerError => e
          puts "negative numbers not allowed <negative_number>"
        end
      else
        return numbers.to_i
      end
    else
      puts "input should be string of comma-separated numbers"
    end
  end
end