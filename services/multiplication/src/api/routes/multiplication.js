const express = require("express");

const multiplication = require("../../actions/multiplication");
const { isNumber } = require("../../common");

const router = express.Router();

router.post("/", (request, response) => {
  const left = request.body && request.body.left;
  const right = request.body && request.body.right;

  console.log("left number bla = " + left);
  console.log("right number bla = " + right);

  if (!isNumber(left)) {
    return response
      .status(400)
      .send({ error: 'invalid "left" value, must be a number' });
  }

  if (!isNumber(right)) {
    return response
      .status(400)
      .send({ error: 'invalid "right" value, must be a number' });
  }

  const result = multiplication(left, right);

  return response.status(200).send({ type: "number", value: result });
});

module.exports = router;
