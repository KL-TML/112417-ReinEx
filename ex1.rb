ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]

# First step is put all reps in a hash. This way you can iterate through
candidates = []

# Iteration through the array to bring out the keys of the hash
ballots.each do |vote|
  candidates << vote.values
end

candidates.flatten!.uniq!

total_votes = Hash.new(0)

ballots.each do |vote|
  candidates.each do |c|
    if vote.key(c) == 1
      total_votes[c] += 3
    elsif vote.key(c) == 2
      total_votes[c] += 2
    elsif vote.key(c) == 3
      total_votes[c] += 1
    end
  end
end

winner = total_votes.key(total_votes.values.max)

puts "Most votes go to #{winner}"
