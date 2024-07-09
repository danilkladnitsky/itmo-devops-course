const express = require("express");
const app = express();
const cors = require("cors");
const port = 3000;

const { Pool } = require("pg");

const pool = new Pool({
  host: "postgres-service",
  database: "postgres",
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  port: 5432,
});

app.get("/healthcheck", cors(), (_, res) => {
  console.log("checked!");
  res.send("OK");
});

app.get("/status", cors(), async (_, res) => {
  try {
    const client = await pool.connect();
    await client.query("SELECT 1");
    client.release();

    res.send("Backend is working wow!");
  } catch (error) {
    console.error("Database connection error:", error);
    res.status(500).send("Internal Server Error");
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
