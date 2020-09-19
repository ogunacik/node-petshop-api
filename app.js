const config = require('./config');
const express = require("express");
const app = express();

app.listen(config.port, () => {
    console.log(`Server running on port ${config.port}`);
});


app.get("/", (req, res, next) => {
   res.json(
        {
          "Status": "200 OK"
        }
    );
});

app.get("/pets", (req, res, next) => {
    res.json(
      [
        {
          "id": 1,
          "type": "dog",
          "price": 249.99
        },
        {
          "id": 2,
          "type": "cat",
          "price": 294.99
        },
        {
          "id": 3,
          "type": "fish",
          "price": 0.99
        }
      ]
    );
});

app.get("/pets/1", (req, res, next) => {
   res.json(
        {
          "id": 1,
          "type": "dog",
          "price": 249.99
        }
    );
});

app.get("/pets/2", (req, res, next) => {
    res.json(
         {
           "id": 2,
           "type": "cat",
           "price": 124.99
         }
     );
 });

 app.get("/pets/3", (req, res, next) => {
    res.json(
         {
           "id": 3,
           "type": "fish",
           "price": 0.99
         }
     );
 });
