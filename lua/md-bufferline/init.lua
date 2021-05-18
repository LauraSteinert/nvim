require('bufferline').setup{
	options = {
		view = "default",
		numbers =  "ordinal",
		number_style = "" ,
		mappings = true,
		buffer_close_icon= '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 12,
		max_prefix_length = 15,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(_, _, diagnostics_dict)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
				or (e == "warning" and " " or "" )
				s = s .. n .. sym
			end
			return s
		end,
		custom_filter = function(buf_number)
			-- not working
			if vim.fn.bufname(buf_number) ~= "zsh" then
				return true
			end
		end,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style =  "thick",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = function(buffer_a, buffer_b)
			return (buffer_a.id < buffer_b.id)
		end
	}
}
