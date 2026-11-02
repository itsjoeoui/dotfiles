rex.bind("ctrl+a>c", "client.tab.new")
rex.bind("ctrl+a>n", "client.tab.next")
rex.bind("ctrl+a>p", "client.tab.previous")

rex.bind("ctrl+a>shift+\\", "pane.split", { direction = "right" })
rex.bind("ctrl+a>shift+-", "pane.split", { direction = "down" })

rex.bind("ctrl+a>z", "pane.zoom")
rex.bind("ctrl+a>x", "pane.close")
rex.bind("ctrl+a>q", "pane.close")

rex.unbind("alt+cmd+left", "pane.focus.left")
rex.unbind("alt+cmd+right", "pane.focus.right")
rex.unbind("alt+cmd+up", "pane.focus.up")
rex.unbind("alt+cmd+down", "pane.focus.down")

require("vim-rex-navigator").setup()

for i = 1, 9 do
	rex.bind("ctrl+a>" .. i, "client.tab.goto", { index = i })
end

rex.mode("resize", { exclusive = true })

rex.action({
	name = "start_resize",
	title = "Start resizing panes",
	args = { direction = "string" },
	run = function(ctx, args)
		rex.client.queue("pane.resize", {
			direction = args.direction,
		})
		rex.client.queue("client.mode.enter", {
			name = "resize",
		})
	end,
})

for key, direction in pairs({
	h = "left",
	j = "down",
	k = "up",
	l = "right",
}) do
	rex.bind("ctrl+a>" .. key, "start_resize", {
		direction = direction,
	})
	rex.bind("resize/" .. key, "pane.resize", {
		direction = direction,
	})
end

rex.bind("resize/enter", "client.mode.exit")
