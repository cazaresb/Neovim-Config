return {
  "sphamba/smear-cursor.nvim",

  opts = {
    -- Core motion behavior
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    smear_insert_mode = true,

    -- Your font does not need legacy block symbols unless you know it supports them well
    legacy_computing_symbols_support = false,

    -- Particle behavior
    particles_enabled = true,
    particles_over_text = true,
    never_draw_over_target = true,

    particle_max_num = 80,
    particle_spread = 0.35,
    particles_per_second = 140,
    particles_per_length = 0.8,

    particle_max_lifetime = 220,
    particle_lifetime_distribution_exponent = 4,

    particle_max_initial_velocity = 8,
    particle_velocity_from_cursor = 0.15,
    particle_random_velocity = 35,

    particle_damping = 0.25,
    particle_gravity = 14,
    min_distance_emit_particles = 1.5,

    particle_switch_octant_braille = 0.3,
  },

  config = function(_, opts)
    vim.opt.termguicolors = true

    require("smear_cursor").setup(opts)

    local bg = "#222436"

    local function apply_smear_cursor_highlights()
      vim.api.nvim_set_hl(0, "CursorLine", { bg = bg })
      vim.api.nvim_set_hl(0, "CursorColumn", { bg = bg })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = bg })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })
      vim.api.nvim_set_hl(0, "LineNr", { bg = bg })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
    end

    apply_smear_cursor_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_smear_cursor_highlights,
    })
  end,
}
