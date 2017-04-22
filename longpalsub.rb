# Enter your code here. Read input from STDIN. Print output to STDOUT

def long_pal(str)
    len = str.length
    while len > 0
        str.chars.each_cons(len).each do |subarr|
            substr = subarr.join("")
            if substr == substr.reverse
              return substr
            end
        end
        len -= 1
    end
end

q = gets.chomp.to_i

q.times do
    n, k = gets.chomp.split(" ")
    str = gets.chomp
    result = 0
    letters = str.chars.uniq
    init_length = long_pal(str).length
    (n + 1).times do |i|
        letters.each do |letter|
            if i == 0
                new_str = letter + str
            elsif i == n
                new_str = str + letter
            else
                new_str = str[0...i] + letter + str[i..-1]
            end
            if long_pal(new_str).length - init_length == k
                result += 1
            end
        end
    end
    puts result
end
