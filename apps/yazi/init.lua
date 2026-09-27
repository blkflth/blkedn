require("git"):setup {
	-- Order of status signs showing in the linemode
	order = 1500,
}
th.dupes = th.dupes or {}
-- th.dupes.mark_style = ui.Style():fg("#FFFFFF")
th.dupes.mark_style = ui.Style():fg("blue")
th.dupes.mark_sign = "X"

require("dupes"):setup {
	-- Global settings
	save_op = false,        -- Save results to file by default
	-- auto_confirm = true, -- Skip confirmation for apply (use with caution!)
	
	profiles = {
		-- Interactive mode: recursively scan and display duplicates
		interactive = {
			args = { "-r" },
		},
		-- Apply mode: recursively scan and DELETE duplicates
		apply = {
			args = { "-r", "-N", "-d" },
			save_op = true,  -- Save results before deletion
		},
		-- Custom profile example (uncomment to use)
		-- custom = {
		-- 	args = { "-r", "-s", },  -- Your custom jdupes flags
		-- },
	},
}

require("relative-motions"):setup({ show_numbers="relative", show_motion = true, enter_mode ="first" })

require("close-and-restore-tab"):setup()

require("sshfs"):setup()
