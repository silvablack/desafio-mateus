/**
 * @author Paulo Silva
 * @description Routes Index
 * @returns methods <get>
 * @version 0.0.1
 */


/**
 * @requires express
 */
const express = require('express');

/**
 * @requires express.Router
 */
const router = express.Router();

/**
 * @returns Infomations on Service
 */
router.get('/', (req, res) => {
  res.status(200).send({
    title: 'Estoque Service',
    version: '0.0.1',
  });
});

module.exports = router;
