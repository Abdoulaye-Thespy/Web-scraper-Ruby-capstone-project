module Methods
  def check?(chek, page_choice)
    if chek[page_choice] == 0
      chek[page_choice] = 1
      true
    else false
    end
  end
end
