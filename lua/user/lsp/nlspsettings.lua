local status_ok, server = pcall(require, "nlspsettings")
if not status_ok then
  return
end

server.setup()
