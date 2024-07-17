def create_favorite_hash(color, number)
  {
    color: color,
    number: number
  }
end

def favorite_color(hash)
  return hash[:color]
end

def favorite_number(hash)
  return hash.fetch(:number)
end

def update_favorite_movie(hash, movie)
  return hash[:movie] = movie
end

def remove_favorite_number(hash)
  no_number_hash = hash.delete(:number)
  return no_number_hash
end

def favorite_categories(hash)
  return hash.keys
end

def favorite_items(hash)
  return hash.values
end



favorite_hash = create_favorite_hash("blue", 11)
puts favorite_color(favorite_hash)
puts favorite_number(favorite_hash)
update_favorite_movie(favorite_hash, "The Dark Knight")
remove_favorite_number(favorite_hash)
puts favorite_hash
puts favorite_items(favorite_hash)