class Terminal
  def select(items)
    puts "Please, select action (type action's index):"

    items.each_with_index do |item, index|
      "#{index}. #{item.title}"
    end

    selected_action = gets.chomp
    items[selected_action.to_i]
  end

  def enter_value(title)
    puts title
    gets.chomp
  end
end
