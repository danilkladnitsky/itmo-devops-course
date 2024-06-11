const express = require("express");
const app = express();
const cors = require("cors");
const port = 3000;

app.get("/healthcheck", cors(), (_, res) => {
  console.log("checked!");
  res.send("OK");
});

app.get("/status", cors(), (_, res) => {
  res.send("Backend is working wow!");
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
