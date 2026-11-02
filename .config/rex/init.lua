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

for key, direction in pairs({
	h = "left",
	j = "down",
	k = "up",
	l = "right",
}) do
	rex.bind("ctrl+alt+" .. key, "pane.resize", {
		direction = direction,
		amount = 3,
	})
end
