return {
  "vuki656/package-info.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = { "BufReadPost package.json", "BufNewFile package.json" },
  cmd = {
    "PackageInfoShow",
    "PackageInfoShowForce",
    "PackageInfoHide",
    "PackageInfoToggle",
    "PackageInfoUpdate",
    "PackageInfoDelete",
    "PackageInfoInstall",
    "PackageInfoChangeVersion",
  },
  opts = {},
}
