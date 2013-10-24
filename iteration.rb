def cats_in_hats
  cats = [false] * 100
  (1..100).each do |round|
    cat = round
    while cat <= cats.length
      cats[cat - 1] = !cats[cat - 1]
      cat += round
    end
  end
  cats
end

p cats_in_hats
