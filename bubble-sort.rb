def bubble_sort(array) 
  for k in (0...(array.length-1))
    for i in (1...(array.length-k))
      if array[i] < array[i - 1]
        array[i - 1], array[i] = array[i], array[i - 1]
      end
    end
  end

  return array
end

p bubble_sort([4,3,78,2,0,2])
