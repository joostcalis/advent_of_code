class SpiralBuilder
  attr_reader :x, :y

  DIRECTIONS = {
    right: {
      next_dir: :up,
      operator: '+x'
    },
    up: {
      next_dir: :left,
      operator: '+y'
    },
    left: {
      next_dir: :down,
      operator: '-x'
    },
    down: {
      next_dir: :right,
      operator: '-y'
    }
  }

  def initialize(total_steps_count)
    @x = 0
    @y = 0
    @total_steps_count = total_steps_count.to_i
    @current_step = 1
    @current_steps_per_dir = 1
    @dir_changed_count = 0
  end

  def calc_steps_back_to_origin
    build_spiral
    get_amount_of_steps
  end

  def build_spiral
    take_steps(:right)
  end

  def take_steps(direction)
    check_changed_directions
    operator, axes = get_operator_and_axes(direction)
    @current_steps_per_dir.times do
      set_axes_value(axes, operator)
      increment_current_step
      return if destination_reached?
    end
    next_direction = change_direction(direction)
    take_steps(next_direction)
  end

  def get_operator_and_axes(direction)
    DIRECTIONS[direction][:operator].chars
  end

  def set_axes_value(axes, operator)
    instance_variable_set("@#{axes}", instance_variable_get("@#{axes}").send(operator, 1))
  end

  def check_changed_directions
    if changed_direction_twice?
      increase_steps_per_dir
      reset_changed_dir_count
    end
  end

  def changed_direction_twice?
    @dir_changed_count == 2
  end

  def increase_steps_per_dir
    @current_steps_per_dir += 1
  end

  def reset_changed_dir_count
    @dir_changed_count = 0
  end

  def increment_current_step
    @current_step += 1
  end

  def change_direction(current_direction)
    increase_changed_dir_count
    DIRECTIONS[current_direction][:next_dir]
  end

  def increase_changed_dir_count
    @dir_changed_count += 1
  end

  def destination_reached?
    @current_step == @total_steps_count
  end

  def get_amount_of_steps
    @y.abs + @x.abs
  end

end
