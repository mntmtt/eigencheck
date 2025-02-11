function modified_value = random_error(value, max_relative)
modified_value = value * (1 + 2 * max_relative * rand() - max_relative);
end