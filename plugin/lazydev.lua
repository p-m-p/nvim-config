local ok, lazydev = pcall(require, "lazydev")

if not ok then
  return
end

lazydev.setup()
