return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",

      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  debugger_cmd = { "node", vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/dist/vsDebugServer.js" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({ commented = true })
      dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignWarn", linehl = "Visual" })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
      vim.keymap.set("n", "<leader>dc", function() dap.continue() end, opts)
      vim.keymap.set("n", "<leader>do", function() dap.step_over() end, opts)
      vim.keymap.set("n", "<leader>di", function() dap.step_into() end, opts)
      vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, opts)
      vim.keymap.set("n", "<leader>dq", function() dap.terminate() end, opts)
      vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, opts)

      vim.keymap.set("n", "<F5>", function() dap.continue() end, opts)
      vim.keymap.set("n", "<F10>", function() dap.step_over() end, opts)
      vim.keymap.set("n", "<F11>", function() dap.step_into() end, opts)
      vim.keymap.set("n", "<F12>", function() dap.step_out() end, opts)
      vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, opts)
      vim.keymap.set("n", "<F6>", function() dap.terminate() end, opts)

      -- JavaScript/TypeScript debugger configurations
      for _, lang in ipairs({ "typescript", "javascript" }) do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome to localhost",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}