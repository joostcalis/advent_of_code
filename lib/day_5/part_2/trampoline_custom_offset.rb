class TrampolineJumperCustomOffset

  def initialize(trampoline)
    @trampoline = trampoline
    @current_index = 0
    @last_index = 0
    @steps_taken = 0
  end

  def jump_till_exit
    jump until exit_reached?
    @steps_taken
  end

  def jump
    set_last_index
    increment_step_count
    jump_to_new_index
    increment_last_index
  end

  def increment_step_count
    @steps_taken += 1
  end

  def set_last_index
    @last_index = @current_index
  end

  def jump_to_new_index
    @current_index += @trampoline[@current_index]
  end

  def increment_last_index
    @trampoline[@last_index] += @trampoline[@last_index] >= 3 ? -1 : 1
  end

  def exit_reached?
    !@current_index.between?(0, @trampoline.size - 1)
  end

end
