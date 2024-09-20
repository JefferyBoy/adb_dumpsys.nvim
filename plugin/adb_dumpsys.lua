-- adb分析快捷工具
local CMDS = {
	{
		name = "AdbDumpsysWindow",
		command = "adb shell dumpsys window",
		desc = "安卓获取所有窗口",
	},
	{
		name = "AdbDumpsysWindowVisible",
		command = "adb shell dumpsys window visible",
		desc = "安卓获取所有显示的窗口",
	},
	{
		name = "AdbDumpsysWindowVisibleName",
		command = 'adb shell dumpsys window visible | grep "Window #"',
		desc = "安卓获取所有显示的窗口名称",
	},
	{
		name = "AdbDumpsysWindowContainers",
		command = "adb shell dumpsys window containers",
		desc = "安卓获取所有显示的窗口名称",
	},
	{
		name = "AdbDumpsysPackageAll",
		command = "adb shell dumpsys package",
		desc = "安卓获取所有包信息",
	},
	{
		name = "AdbDumpsysPackage",
		command = "adb shell dumpsys package",
		desc = "安卓获取指定包信息",
		nargs = 1,
	},
	{
		name = "AdbPmListPackage",
		command = "adb shell pm list package --user -1 -f",
		desc = "安卓获取所有包安装位置",
	},
	{
		name = "AdbDumpsysInput",
		command = "adb shell dumpsys input",
		desc = "安卓获取输入信息",
	},
	{
		name = "AdbDumpsysSurfaceFlinger",
		command = "adb shell dumpsys SurfaceFlinger",
		desc = "安卓获取SurfaceFlinger",
	},
	{
		name = "AdbDumpsysActivity",
		command = "adb shell dumpsys activity",
		desc = "安卓获取Activity信息",
	},
	{
		name = "AdbDumpsysActivityServices",
		command = "adb shell dumpsys activity services",
		desc = "安卓获取Service信息",
	},
}
-- 运行命令并在当前buffer的下面显示结果
local function run_cmd_and_show_result(cmd)
	local output = vim.fn.systemlist(cmd)
	if output[1] ~= "" then
		-- 在当前buffer的下面拆分创建新的buffer
		-- vim.api.nvim_command("botright new")
		local file = vim.api.nvim_buf_get_name(0)
		file = string.match(file, "([^/]+)$") or ""
		local nbuf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_command("buffer " .. nbuf)
		vim.api.nvim_buf_set_name(nbuf, cmd)
		vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
		vim.api.nvim_buf_set_option(0, "buftype", "nofile")
		-- vim.api.nvim_buf_set_option(0, "bufhidden", "delete")
		vim.api.nvim_buf_set_option(0, "swapfile", false)
		vim.api.nvim_buf_set_option(0, "buflisted", true)
	else
		vim.api.nvim_echo({ { "Error output is empty " .. cmd, "ErrorMsg" } }, true, {})
	end
end

local setup = function()
	for _, cmd in pairs(CMDS) do
		vim.api.nvim_create_user_command(cmd.name, function(c)
			if c ~= nil then
				cmd.command = cmd.command .. " " .. table.concat(c, " ")
			end
			run_cmd_and_show_result(cmd.command)
		end, {
			desc = cmd.desc,
			nargs = cmd.nargs == nil and 0 or cmd.nargs,
		})
	end
end

setup()

