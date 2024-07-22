def create_favorite_hash(color, number)
  {
    color: color,
    number: number
  }
  end

def favorite_color(list)
  list[:color]
end

def favorite_number(list)
  list[:number]
end

def update_favorite_movie(list, movie)
  list[:movie] = movie
  list[:movie]
end

def remove_favorite_number(list)
  list.delete(:number)
  list
end

def favorite_categories(list)
  list.keys
end

def favorite_items(list)
  list.values
end

other_favorites = {
  holiday: "Halloween",
  drink: "Beer"
}

def merge_favorites(list, new_list)
  list.merge(new_list)
end

  favorite_hash = create_favorite_hash("blue", 11)
puts favorite_hash
puts favorite_color(favorite_hash)
puts favorite_number(favorite_hash)
puts update_favorite_movie(favorite_hash, "The Dark Knight")
puts remove_favorite_number(favorite_hash)
puts favorite_categories(favorite_hash)
puts favorite_items(favorite_hash)
puts favorite_hash = merge_favorites(favorite_hash, other_favorites)
puts other_favorites
