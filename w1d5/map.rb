class Map
  def initialize
    @map = []
  end


  def assign(key, value)
    # Creates a new key-value pair or update the value for a pre-existing key
    lookup(key) ? @map[key] = value : @map << [key, value]
  end

  def lookup(key)
    pair = find_key(key)
    pair ? pair[1] : nil
  end

  def remove(key)
    pair = find_key(key)
    @map.delete(pair)
  end

  def find_key(key)
    @map.select { |pair| pair[0] == key }[0]
  end

  def show
    deep_dup(@map)
  end

  private
  
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
