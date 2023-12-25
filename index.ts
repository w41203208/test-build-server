const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 8787;
app.use(express.json());
app.use(cors());

app.get('/', (req: any, res: any) => {
  return res.send('Hello World! Congradulation for you!');
});

const server = app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});
