const path = require("path");

const config = require("./server/config");

let server;

if (process.env.NODE_ENV === "production") {
  const createServer = require("./server/createServer");

  server = createServer(
    path.resolve(__dirname, "public"),
    path.resolve(__dirname, "server/stats.json")
  );
} else {
  const createServer = require("./server/createDevServer");

  server = createDevServer(
    path.resolve(__dirname, "public"),
    require("./webpack.config"),
    config.origin
  );
}

server.listen(config.port, () => {
  console.log("Server listening on port %s, Ctrl+C to stop", config.port);
});
