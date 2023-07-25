local ok, jdtls = pcall(require, "jdtls")

if not ok then
  return
end

local config = {
  cmd = { vim.fn.stdpath "data" .. "/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
jdtls.start_or_attach(config)
