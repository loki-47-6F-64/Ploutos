module CustomContainer

=begin
  Accepts any link in the linked list,
  it automatically finds the root.
=end
class LinkedList
  # Stack of links affected during changes in order.
  attr_reader :affected

  def initialize table
    @table = table
    unless @table.empty?
      set_chain @table[0]
    end
  end

  def insert new_link, spot
    if @root == nil
      @root = new_link
      return
    end
    if spot == 0
      new_link.next = to_id @root
      @root.prev = to_id new_link

      update @root
      update new_link

      @root = new_link
      return
    end

    link = @root

    spot.times do
      if link.next == nil
        link.next = to_id new_link
        new_link.prev = to_id link

        update link
        update new_link
        return
      end

      link = to_link link.next
    end


    new_link.next = to_id link
    new_link.prev = link.prev
    link.prev = to_id new_link

    prev_link = to_link new_link.prev
    prev_link.next = to_id new_link

    update prev_link
    update link
    update new_link
  end

  def delete link
    next_link = to_link link.next
    prev_link = to_link link.prev

    if prev_link == nil
      @root = next_link
      next_link.prev = nil
    else
      prev_link.next = link.next
      update prev_link
    end

    if link.next != nil
      next_link.prev = link.prev
      update next_link
    end
  end

  def move link, spot
    delete link

    insert link, spot
  end

  def each
    link = @root
    while link != nil
      yield link
      link = to_link link.next
    end
  end

  def each_affected
    until affected.empty? do
      link = affected.pop
      yield link
    end
  end

  def set_chain link
    while link.prev != nil do
      link = to_link link.prev
    end
    @root = link
  end

  def update link
    link.save(:validate => false)
  end

  def to_id link
    return link.id
  end
  def to_link id
    return @table.find_by_id(id)
  end
end

end #module
