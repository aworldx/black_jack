class Terminal
  def publish_for_all(text)
    puts text
  end

  def publish_for_person(text, participant)
    puts "#{participant.name}, #{text}"
  end
end
