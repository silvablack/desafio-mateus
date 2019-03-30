/**
 * @author Paulo Silva
 * @description Routes Index
 * @returns methods <get>
 * @version 0.0.1
 */

 const PedidoEstoqueController = require('../controllers/pedidoEstoque');

/**
 * @requires express
 */
const express = require('express');

/**
 * @requires express.Router
 */
const router = express.Router();

/**
 * @description Retorna todos os pedidos de estoque
 * @callback req is request and res is response
 */
router.get('/', (req, res) => {
  PedidoEstoqueController.prototype.buscarTodos().then((result) => {
    res.status(200).send(result);
  }).catch((err) => {
    //ERROR STATUS 500
    res.status(500).send({
      response: {
        error: err.message
      },
    });
  });
});

/**
 * @description Solicita o registro de novo pedido
 * @callback req is request and res is response
 */
router.post('/pedidoEstoque', (req, res) => {
  PedidoEstoqueController.prototype.novoPedido(req.body).then((result) => {
    res.status(200).send(result);
  }).catch((err) => {
    //ERROR STATUS 500
    res.status(500).send({
      response: {
        error: err.message
      }
    })
  });
});

module.exports = router;
