class SumSpiralBuilder
  attr_reader :x, :y, :coordinate_values

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

  def initialize(max_value)
    @x = 0
    @y = 0
    @current_step = 1
    @current_steps_per_dir = 1
    @dir_changed_count = 0
    @coordinate_values = {'x0y0' => 1}
    @max_value = max_value.to_i
  end

  def get_first_value_above_treshold
    build_spiral
    get_value_for_coordinates(@x, @y)
  end

  def build_spiral
    take_steps(:right)
  end

  def take_steps(direction)
    check_changed_directions
    operator, axes = get_operator_and_axes(direction)
    @current_steps_per_dir.times do
      set_axes_value(axes, operator)
      @coordinate_values["x#{@x}y#{@y}"] = get_neighbour_values_sum
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

  def change_direction(current_direction)
    increase_changed_dir_count
    DIRECTIONS[current_direction][:next_dir]
  end

  def increase_changed_dir_count
    @dir_changed_count += 1
  end

  def destination_reached?
    get_value_for_coordinates(@x, @y) > @max_value
  end

  def get_value_for_coordinates(x, y)
    @coordinate_values["x#{x}y#{y}"].to_i
  end

  def get_neighbour_values_sum
    sum = 0
    values = [-1, 0, 1]
    values.each do |x_diff|
      values.each do |y_diff|
        sum += get_value_for_coordinates(@x + x_diff, @y + y_diff) unless x_diff.zero? && y_diff.zero?
      end
    end
    sum
  end

end
sum_spiral_builder = SumSpiralBuilder.new(ARGV[0])
sum_spiral_builder.get_first_value_above_treshold
