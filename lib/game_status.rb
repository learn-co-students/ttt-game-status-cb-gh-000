def position_taken?(board, location)
  !(position(board, location).nil? || position(board, location) == "")
end

# Define won?, winner and draw? below