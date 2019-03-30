const PedidoEstoqueModel = require('../model/pedidoEstoqueModel');

/**
 * @requires Http Status
 */
const HttpStatus = require('http-status');

/**
* @description Resposta padronizada
*/
const defaultResponse = (data, statusCode = HttpStatus.OK) => ({
    data,
    statusCode,
  });
  
  const errorResponse = (message, statusCode = HttpStatus.BAD_REQUEST) => defaultResponse({
    error: message,
  }, statusCode);

class PedidoEstoqueController {

    /**
     * @param {Request} req
     * @param {Response} res
     * @returns Promise PedidoEstoque.findAll()
     */
  buscarTodos() {
    return new Promise((resolve, reject) => {
      PedidoEstoqueModel.prototype.buscarTodos()
         .then((result) => {
            resolve(defaultResponse(result));
        }).catch(err => reject(errorResponse(err.message)));
    });
  }

  novoPedido(data) {
    return new Promise((resolve, reject) => {
      PedidoEstoqueModel.prototype.novoPedido(data)
         .then((result) => {
            resolve(defaultResponse(result));
        }).catch(err => reject(errorResponse(err.message)));
    });
  }
}

module.exports = PedidoEstoqueController;