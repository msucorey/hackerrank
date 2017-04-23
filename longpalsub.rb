# Enter your code here. Read input from STDIN. Print output to STDOUT

def long_pal(str)
  return "" if str.empty?
  return str if str.length == 1
  len = str.length
  min_start = 0
  max_len = 1
  start_index = 0
  while start_index < len
    break if (len - start_index) <= (max_len / 2)
    start = stop = start_index
    while stop < (len - 1) && (str[stop] == str[stop + 1])
      stop += 1
    end
    start_index = stop + 1
    while (stop < len - 1) && (str[stop + 1] == str[start - 1])
      stop += 1
      start -= 1
    end
    new_len = stop - start + 1
    if new_len > max_len
      min_start = start
      max_len = new_len
    end
  end
  str.slice(min_start, max_len)
end

string longestPalindrome(string s) {
    if (s.empty()) return "";
    if (s.size() == 1) return s;
    int min_start = 0, max_len = 1;
    for (int i = 0; i < s.size();) {
      if (s.size() - i <= max_len / 2) break;
      int j = i, k = i;
      while (k < s.size()-1 && s[k+1] == s[k]) ++k; // Skip duplicate characters.
      i = k+1;
      while (k < s.size()-1 && j > 0 && s[k + 1] == s[j - 1]) { ++k; --j; } // Expand.
      int new_len = k - j + 1;
      if (new_len > max_len) { min_start = j; max_len = new_len; }
    }
    return s.substr(min_start, max_len);
}

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
