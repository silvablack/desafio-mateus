const connection = require('../config/db');

class PedidoEstoqueModel {
    constructor() {
    }

    buscarTodos() {
        return new Promise((resolve, reject) => {
            connection.query('SELECT * FROM pedido_estoque', (error, results) => {
                if (error) throw error;
                resolve(results);
            });
        });
    }

    /**
     * Solicita um novo pedido e remete a insercao em uma transaction
     * @param {*} data 
     * @param {*} entrada 
     */
    novoPedido(data, entrada = true) {
        return new Promise((resolve, reject) => {
            connection.beginTransaction((err)=>{
                if (err) throw err;
                connection.query('INSERT INTO pedido_estoque (dataSolicitacao, tipoSolicitacao) VALUES (?, ?)', [ data.dataSolicitacao, entrada ], (error, results) => {
                    if (error) {
                        return connection.rollback(function(){
                            throw error;
                        })
                    }
                    let idPedidoEstoque = results.insertId;
                    data.itensPedido.forEach(element => {
                        connection.query('INSERT INTO item_ped_estoque (idPedidoEstoque, idEstoque, qntSolicitada) VALUES (?, ?, ?)', [ idPedidoEstoque, data.idEstoque, data.qntSolicitada], (error, results) => {
                            if(error) {
                                connection.rollback((err)=>{
                                    throw err;
                                })
                            }
                        });
                    });

                    // commitando todas as transacoes
                    connection.commit((err) => {
                        if (err) {
                            connection.rollback((err)=>{
                                throw err;
                            })
                        }
                    })
                    
                });
            });
            
        })
    }

}

module.exports = PedidoEstoqueModel;