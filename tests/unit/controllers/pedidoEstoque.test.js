const PedidoEstoqueController = require('../../../src/controllers/pedidoEstoque');

describe('Controller Pedido Estoque', () => {
  describe('Todos os pedidos', () => {
        it('Deve retornar uma lista com todos os elementos', (done) => {
        const PedidoEstoqueModel = {
            buscarTodos: td.function(),
        };
        const expectResponse = [{
            idPedidoEstoque: '1',
            dataSolicitacao: Date.now(),
            tipoSolicitacao: 'ENTRADA',
        }];
        td.when(PedidoEstoqueModel.buscarTodos()).thenResolve(expectResponse);
        PedidoEstoqueController.prototype.buscarTodos().then((response) => {
            expect(response.data).to.be.eql(expectResponse);
            done();
        });
        });
    });
});