class MemoryBankOptimizer

  def initialize(memory)
    @memory = memory
    @re_allocations_done = 0
    @produced_mem_banks = []
  end

  def redistribute_blocks_till_mem_bank_duplication
    redistribute_memory! until duplication_found?
    return_amount_of_re_allocations_done
  end

  def redistribute_memory!
    add_current_memory_to_mem_bank_storage!
    get_index_and_value_of_max_mem_bank
    run_block_re_allocation!
    increment_finished_re_allocations!
  end

  def add_current_memory_to_mem_bank_storage!
    @produced_mem_banks << @memory.dup
  end

  def get_index_and_value_of_max_mem_bank
    @max_mem_bank_location = @memory.index(@memory.max)
    @max_mem_bank_value = @memory.max
  end

  def run_block_re_allocation!
    empty_max_bank!
    re_allocate_blocks!
  end

  def re_allocate_blocks!
    (1..@max_mem_bank_value).each do |offset|
      block_index = (@max_mem_bank_location + offset) % @memory.size
      @memory[block_index] += 1
    end
  end

  def empty_max_bank!
    @memory[@max_mem_bank_location] = 0
  end

  def increment_finished_re_allocations!
    @re_allocations_done += 1
  end

  def duplication_found?
    @produced_mem_banks.include?(@memory)
  end

  def return_amount_of_re_allocations_done
    @re_allocations_done
  end

end
