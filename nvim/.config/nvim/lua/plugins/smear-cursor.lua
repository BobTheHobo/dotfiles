return {
  "sphamba/smear-cursor.nvim",
  opts = {                         -- Default  Range
    stiffness = 0.8,               -- 0.6      [0, 1]
    trailing_stiffness = 0.5,      -- 0.3      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = false,
    -- Dont's smear when moving to command
    smear_to_cmd = false,
    enabled = true,
  },
}
