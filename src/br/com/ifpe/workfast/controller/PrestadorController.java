package br.com.ifpe.workfast.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import br.com.ifpe.workfast.model.Avaliacao;
import br.com.ifpe.workfast.model.AvaliacaoDao;
import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;
import br.com.ifpe.workfast.model.ChatSolicitacao;
import br.com.ifpe.workfast.model.ChatSolicitacaoDao;
import br.com.ifpe.workfast.model.ChatVO;
import br.com.ifpe.workfast.model.Cidade;
import br.com.ifpe.workfast.model.CidadeAtuacaoServico;
import br.com.ifpe.workfast.model.CidadeAtuacaoServicoDao;
import br.com.ifpe.workfast.model.CidadeDao;
import br.com.ifpe.workfast.model.Contrato;
import br.com.ifpe.workfast.model.ContratoDao;
import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Endereco;
import br.com.ifpe.workfast.model.EnderecoDao;
import br.com.ifpe.workfast.model.Estado;
import br.com.ifpe.workfast.model.EstadoDao;
import br.com.ifpe.workfast.model.ListaPedidosPendentesVO;
import br.com.ifpe.workfast.model.Pendencias;
import br.com.ifpe.workfast.model.PendenciasDao;
import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;
import br.com.ifpe.workfast.model.Servico;
import br.com.ifpe.workfast.model.ServicoDao;
import br.com.ifpe.workfast.model.SolicitacaoContrato;
import br.com.ifpe.workfast.model.SolicitacaoContratoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;
import br.com.ifpe.workfast.model.UsuarioProfissao;
import br.com.ifpe.workfast.model.UsuarioProfissaoDao;
import br.com.ifpe.workfast.model.UsuarioServico;
import br.com.ifpe.workfast.model.UsuarioServicoDao;
import br.com.ifpe.workfast.util.Util;

@Controller
public class PrestadorController {

	private Contrato contrato;

	// metodo para redirecionar para pagina inicial
	@RequestMapping("paginaInicialPrestador")
	public String paginaInical() {

		return "prestador/index";
	}

	// metodo para mostrar solicitacões na area
	@RequestMapping(value = "buscarSolicitacoesDoPrestadorLogado", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String buscarSolicitacoesIndex(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> lista = dao.listarPedidosPrestador(idUsuario);

		return new Gson().toJson(lista);
	}

	// metodo para redirecionar para pagina especializacao
	@RequestMapping("paginaEspecializacao")
	public String paginaEspecializacao(Model model, HttpServletRequest request) {
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		UsuarioProfissaoDao dao = new UsuarioProfissaoDao();
		List<UsuarioProfissao> lista = dao.listarProfissaoUsuario(usuario.getIdUsuario());
		model.addAttribute("listaProfissaoUsuario", lista);

		return "prestador/especializacao";
	}

	// metodo para redirecionar para pagina especializacao
	@RequestMapping("adicionarProfissao")
	public String adicionarProfissao(Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		model.addAttribute("listaProfissao", lista);

		return "prestador/addProfissao";
	}

	@RequestMapping(value = "saveProfissaoUsuario", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String saveProfissaoUsuario(@RequestParam("idProfissao") Integer idProfissao,
			@RequestParam("idUsuario") Integer idUsuario) {

		Usuario usuario = new Usuario();
		Profissao profissao = new Profissao();
		usuario.setIdUsuario(idUsuario);
		profissao.setIdProfissao(idProfissao);

		UsuarioProfissao usuarioProfissao = new UsuarioProfissao();
		usuarioProfissao.setProfissao(profissao);
		usuarioProfissao.setUsuario(usuario);

		UsuarioProfissaoDao dao = new UsuarioProfissaoDao();

		boolean existe = dao.existeVinculacao(idUsuario, idProfissao);
		if (!existe) {
			dao.salvar(usuarioProfissao);
		}

		return new Gson().toJson(existe);

	}

	@RequestMapping("deleteUsuarioProfissao")
	public String delete(@RequestParam("id") Integer id, Model model) {

		UsuarioProfissaoDao dao = new UsuarioProfissaoDao();
		dao.remover(id);
		model.addAttribute("msg", "Profissão removido com Sucesso");

		return "forward:paginaEspecializacao";
	}

	/* ------------------------------- Serviço ----------------------------- */
	// verificar estagios da solicitacao
	@RequestMapping(value = "verificarEstagios", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String verificandoDetalheSolicitacao(@RequestParam("cas") Integer idSolicitacao, Model model) {

		String encaminhar = "";
		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		SolicitacaoContrato solicitacao = dao.buscarPorId(idSolicitacao);

		// encaminhado para o segundo estagio
		if (solicitacao.getEstagio().equals("2") && solicitacao.getStatus().equals("1")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "SegundaEtapa";

		} else if (solicitacao.getEstagio().equals("3") && solicitacao.getStatus().equals("1")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "detalheContratoPrestador";

		} else if (solicitacao.getEstagio().equals("4") && solicitacao.getStatus().equals("3")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "QuartaEtapa";

		} else if (solicitacao.getEstagio().equals("5") && solicitacao.getStatus().equals("2")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "QuintaEtapa";

		} else {
			encaminhar = "paginaInicialPrestador";
		}

		return new Gson().toJson(encaminhar);

	}

	// metodo para redirecionar para pagina de Serviço pendentes
	@RequestMapping("ServicosEmAberto")
	public String servicosPendente(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaEmAberto = dao.listarPedidosPrestadorEmAberto(idUsuario);
		model.addAttribute("listaEmAberto", listaEmAberto);

		return "prestador/servico_aberto";
	}

	// metodo para redirecionar para pagina de Serviço finalizados
	@RequestMapping("ServicosFinalizados")
	public String servicosFinalizado(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaEmFinalizado = dao.listarPedidosPrestadorEmFinalizado(idUsuario);
		model.addAttribute("listaEmFinalizado", listaEmFinalizado);
		return "prestador/servico_finalizado";
	}

	// metodo para redirecionar para pagina de Serviço finalizados
	@RequestMapping("ServicosCancelados")
	public String servicosCancelados(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaCancelado = dao.listarPedidosPrestadorEmCancelado(idUsuario);
		model.addAttribute("listaCancelados", listaCancelado);
		return "prestador/servico_cancelado";
	}

	// metodo para redirecionar para pagina de Serviço finalizados
	@RequestMapping("Propostas")
	public String propostas() {

		return "prestador/proposta";
	}

	// metodo para redirecionar para pagina de Serviço finalizados
	@RequestMapping("ServicosEmAndamento")
	public String servicosEmAndamento(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaEmAndamento = dao.listarPedidosPrestadorEmAndamento(idUsuario);
		model.addAttribute("listaEmAndamento", listaEmAndamento);

		return "prestador/servico_em_andamento";
	}

	// metodo para o prestador aceitar o pedido escolhido
	@RequestMapping(value = "aceitarPedido", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String aceitarPedido(@RequestParam("cas") Integer idSolicitacao) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		SolicitacaoContrato obj = dao.buscarPorId(idSolicitacao);
		obj.setEstagio("2");
		obj.setConvite("1");
		dao.update(obj);
		return new Gson().toJson("verificarEstagios");
	}

	// metodo para o prestador recusar o pedido escolhido
	@RequestMapping(value = "recusarPedido", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String recusarPedido(@RequestParam("cas") Integer idSolicitacao) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		SolicitacaoContrato obj = dao.buscarPorId(idSolicitacao);
		obj.setEstagio("0");
		obj.setConvite("0");
		obj.setStatus("0");
		dao.update(obj);
		return new Gson().toJson("verificarEstagios");
	}

	@RequestMapping("PrimeiraEtapa")
	public String primeiroEtapa(@RequestParam("cas") Integer idSolicitacao, Model model, HttpServletRequest request) {
		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		ListaPedidosPendentesVO solicitacao = dao.buscarPedidoPendente(idSolicitacao);

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		EnderecoDao dao2 = new EnderecoDao();
		Endereco endereco = dao2.buscarEnderecoUsuarioPrestador(usuario.getIdUsuario());

		model.addAttribute("endereco", endereco);
		model.addAttribute("proposta", solicitacao);
		return "prestador/1_estagio";
	}

	@RequestMapping("SegundaEtapa")
	public String segundaEtapa(@RequestParam("cas") Integer idSolicitacao, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		ListaPedidosPendentesVO solicitacao = dao.buscarPedidoPendente(idSolicitacao);
		model.addAttribute("proposta", solicitacao);
		return "prestador/2_estagio";
	}

	// metodo para o prestador aceitar o pedido escolhido
	@RequestMapping(value = "popularChat", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String popularChat(@RequestParam("idProposta") Integer idProposta,
			@RequestParam("idCliente") Integer idCliente, @RequestParam("idPrestador") Integer idPrestador) {

		ChatSolicitacaoDao dao = new ChatSolicitacaoDao();
		List<ChatVO> lista = dao.popularChat(idPrestador, idCliente, idProposta);
		for (ChatVO chat : lista) {
			System.out.println(chat.getIdCliente() + "- " + chat.getIdPrestador());
			System.out.println(chat.getNomeCLiente() + "- " + chat.getNomeFantasiaCliente());
			System.out.println(chat.getNomePrestador() + "- " + chat.getNomeFantasiaPrestador());
		}
		return new Gson().toJson(lista);
	}

	@RequestMapping("TerceiraEtapa")
	public String terceiraEtapa(@RequestParam("cas") Integer idSolicitacao, Model model) {
		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		ListaPedidosPendentesVO solicitacao = dao.buscarPedidoPendente(idSolicitacao);
		model.addAttribute("proposta", solicitacao);
		return "prestador/3_estagio";
	}

	@RequestMapping("QuartaEtapa")
	public String quartaEtapa(@RequestParam("cas") Integer idSolicitacao, Model model, Model model1, Model model2,
			Model model3, Model model4, Model model5, Model model6) {

		ContratoDao daoContrato = new ContratoDao();
		Contrato contrato = daoContrato.buscarContratoPorSolicitacao(idSolicitacao);

		SolicitacaoContratoDao daoSolicitacao = new SolicitacaoContratoDao();
		SolicitacaoContrato solicitacao = daoSolicitacao
				.buscarPorId(contrato.getSolicitacao().getIdSolicitacaoContrato());

		DadosPessoaisDao daoDados = new DadosPessoaisDao();
		DadosPessoais clienteDados = daoDados.buscarDadosPessoaisUsuario(solicitacao.getUsuario().getIdUsuario());
		DadosPessoais prestadorDados = daoDados
				.buscarDadosPessoaisUsuario(solicitacao.getUsuarioServico().getUsuario().getIdUsuario());

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco clienteEndereco = solicitacao.getEndereco();
		Endereco prestadorEndereco = daoEndereco
				.buscarEnderecoUsuario(solicitacao.getUsuarioServico().getUsuario().getIdUsuario());

		model1.addAttribute("contrato", contrato);
		model2.addAttribute("solicitacao", solicitacao);
		model3.addAttribute("clienteDados", clienteDados);
		model4.addAttribute("prestadorDados", prestadorDados);
		model5.addAttribute("clienteEndereco", clienteEndereco);
		model6.addAttribute("prestadorEndereco", prestadorEndereco);

		return "prestador/4_estagio";
	}

	@RequestMapping("QuintaEtapa")
	public String quintaEtapa(@RequestParam("cas") Integer idSolicitacao, Model model,  Model model2) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		AvaliacaoDao dao2 = new AvaliacaoDao();

		
		model2.addAttribute("proposta", idSolicitacao);
			
		Avaliacao avalicao = dao2.buscarAvalicaoPorId(idSolicitacao);
		model.addAttribute("avalicao", avalicao);	
		
		
		return "prestador/5_estagio";
	}

	// chat
	@RequestMapping(value = "enviarMensagemChatPrestador", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String enviarMensagem(@RequestParam("msg") String mensagem,
			@RequestParam("idCliente") Integer idCliente, @RequestParam("idPrestador") Integer idPrestador,
			@RequestParam("idProposta") Integer idProposta) {

		Usuario userSend = new Usuario();
		Usuario userReceive = new Usuario();
		userSend.setIdUsuario(idPrestador);
		userReceive.setIdUsuario(idCliente);

		SolicitacaoContrato proposta = new SolicitacaoContrato();
		proposta.setIdSolicitacaoContrato(idProposta);

		ChatSolicitacaoDao dao = new ChatSolicitacaoDao();

		ChatSolicitacao chat = new ChatSolicitacao();
		chat.setMensagem(mensagem);
		chat.setUsuarioPrestador(userSend);
		chat.setUsuarioCliente(userReceive);
		chat.setEnviadoPor(idPrestador);
		chat.setSolicitacaoContrato(proposta);

		dao.publicarMensagem(chat);

		return new Gson().toJson("send");
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("ExibirServicos")
	public String ExibirServico(Model modelServico, Model modelCidades, HttpServletRequest request) {
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		UsuarioServicoDao dao = new UsuarioServicoDao();

		List<UsuarioServico> listaUsuarioServico = dao.listarServicosUsuario(usuario.getIdUsuario());

		modelServico.addAttribute("listaUsuarioServico", listaUsuarioServico);

		return "prestador/servicos";
	}

	// metodo para adicionar servicos
	@RequestMapping("servicosAdd")
	public String servicosAdd(Model modelCategoria, Model modelCidades, Model modelEstado, HttpServletRequest request) {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco enderecoPrestador = daoEndereco.buscarEnderecoUsuarioPrestador(2);

		CidadeDao daoCidade = new CidadeDao();
		List<Cidade> listaCidades = daoCidade.filtrarPorEstado(enderecoPrestador.getEstado().getIdEstado());

		CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoria = dao.listar();

		modelCategoria.addAttribute("listaCategoria", listaCategoria);
		modelCidades.addAttribute("listaCidades", listaCidades);
		modelEstado.addAttribute("endereco", enderecoPrestador);
		return "prestador/addServico";
	}

	// metodo para editar servicos
	@RequestMapping("servicosEdit")
	public String servicosEdit(@RequestParam("id") Integer idUsuarioServico, Model modelServico, Model modelCategoria,
			Model modelCidadesServicos, Model modelCidades, Model modelEstado, Model lista,
			HttpServletRequest request) {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		UsuarioServicoDao daoServicoUsuario = new UsuarioServicoDao();
		UsuarioServico usuarioServico = daoServicoUsuario.buscarPorId(idUsuarioServico);

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco enderecoPrestador = daoEndereco.buscarEnderecoUsuarioPrestador(2);

		CidadeDao daoCidade = new CidadeDao();
		List<Cidade> listaCidades = daoCidade.filtrarPorEstado(enderecoPrestador.getEstado().getIdEstado());

		CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoria = dao.listar();

		CidadeAtuacaoServicoDao daoCidadesServico = new CidadeAtuacaoServicoDao();
		List<CidadeAtuacaoServico> listaCidadesServico = daoCidadesServico.buscarPorIdUsuarioServico(idUsuarioServico);
		ArrayList<String> listaIdCidades = new ArrayList<String>();
		for (int i = 0; i < listaCidadesServico.size(); i++) {
			listaIdCidades.add(listaCidadesServico.get(i).getCidade().getIdCidade() + "");

		}

		modelCategoria.addAttribute("listaCategoria", listaCategoria);
		modelCidades.addAttribute("listaCidades", listaCidades);
		modelEstado.addAttribute("endereco", enderecoPrestador);
		modelServico.addAttribute("usuarioServico", usuarioServico);
		modelCidadesServicos.addAttribute("listaCidadesServico", listaIdCidades);

		return "prestador/editServico";
	}

	@RequestMapping(value = "updateUsuarioServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String updateServico(@RequestParam("idUsuarioServico") Integer idUsuarioServico,
			@RequestParam("idCategoria") Integer idCategoria, @RequestParam("idServico") Integer idServico,
			@RequestParam("descricao") String descricao, @RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idsCidades") List<String> cidades, @RequestParam("temp") String[] temp) {

		CategoriaServico categoria = new CategoriaServico();
		categoria.setIdCategoriaServico(idCategoria);
		Servico servico = new Servico();
		servico.setIdServico(idServico);
		servico.setCategoriaServico(categoria);
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);

		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setIdUsuarioServico(idUsuarioServico);
		usuarioServico.setServico(servico);
		usuarioServico.setUsuario(usuario);
		usuarioServico.setDescricao(descricao);

		UsuarioServicoController controller = new UsuarioServicoController();
		controller.update(usuarioServico);
		CidadeAtuacaoServicoDao dao2 = new CidadeAtuacaoServicoDao();
		CidadeAtuacaoServico atuacao;
		List<Cidade> listaCidades = new ArrayList<Cidade>();

		for (int i = 0; i < temp.length; i++) {
			int x = 0;
			String idTemp = temp[i].replaceAll("[^0-9]", "");

			for (int j = 0; j < cidades.size(); j++) {

				String id = cidades.get(j).replaceAll("[^0-9]", "");
				if (idTemp.equals(id)) {
					cidades.remove(j);
					x++;
				}

			}
			if (x == 0) {
				atuacao = dao2.buscarCidade(idUsuarioServico, Integer.parseInt(idTemp));
				if (atuacao != null) {
					dao2.remover(atuacao.getIdAtuacaoServico());
				}
			}

		}

		if (cidades.size() > 0) {
			Cidade cidade;
			for (int i = 0; i < cidades.size(); i++) {
				cidade = new Cidade();
				cidade.setIdCidade(Integer.parseInt(cidades.get(i).replaceAll("[^0-9]", "")));
				listaCidades.add(cidade);
			}
			atuacao = new CidadeAtuacaoServico();
			atuacao.setUsuarioServico(usuarioServico);
			dao2.salvar(atuacao, listaCidades);
		}

		return new Gson().toJson("ExibirServicos");

	}

	@RequestMapping(value = "listarCidades", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarCidades(@RequestParam("idUsuarioServico") Integer idUsuarioServico) {

		CidadeAtuacaoServicoDao dao2 = new CidadeAtuacaoServicoDao();

		List<CidadeAtuacaoServico> listaCidades = dao2.buscarPorIdUsuarioServico(idUsuarioServico);

		return new Gson().toJson(listaCidades);

	}

	/* ----------------- Fim Serviço --------------------------------------- */

	// metodo para redirecionar para pagina servicos
	@RequestMapping("paginaServicos")
	public String paginaServicos() {

		return "prestador/servicos";
	}
	
	@RequestMapping("ajudaPrestador")
	public String ajudaPrestador() {

		return "prestador/ajuda";
	}

	// metodo para redirecionar para pagina de cadastro primerio acesso: tipo fisico
	@RequestMapping("cadastroPrestadorFisico")
	public String primeiroAcessoFisico(Model model, Model model2) {
		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		EstadoDao daoEstado = new EstadoDao();
		List<Estado> listaEstado = daoEstado.listar();
		model2.addAttribute("listaEstado", listaEstado);
		model.addAttribute("listaAtaucao", lista);

		return "prestador/cadastroPrestadorFisico";
	}

	@RequestMapping("cadastroPrestadorJuridico")
	public String primeiroAcessoJuridico(Model model, Model model2) {
		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		EstadoDao daoEstado = new EstadoDao();
		List<Estado> listaEstado = daoEstado.listar();
		model2.addAttribute("listaEstado", listaEstado);
		model.addAttribute("listaAtaucao", lista);

		return "prestador/cadastroPrestadorJuridico";
	}

	@RequestMapping("editarDadosPrestadorFisico")
	public String paginaAlterarPrestadorFisico(@RequestParam("IdUsuario") Integer idUsuario, Model model,
			Model model2) {

		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();
		DadosPessoais dados = dao.buscarDadosPessoaisUsuario(idUsuario);
		Endereco endereco = dao2.buscarEnderecoUsuarioPrestador(idUsuario);

		model.addAttribute("dadosPessoais", dados);
		model2.addAttribute("endereco", endereco);
		return "prestador/alterarDadosPrestadorFisico";
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("minhaConta")
	public String minhaConta(Model model, Model model2, HttpServletRequest request) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		DadosPessoais dados = dao.buscarDadosPessoaisUsuario(usuario.getIdUsuario());
		Endereco endereco = dao2.buscarEnderecoUsuarioPrestador(usuario.getIdUsuario());

		model.addAttribute("dadosPessoais", dados);
		model2.addAttribute("endereco", endereco);
		return "prestador/minhaConta";
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("alterarDadosPessoais")
	public String alterarDadosPessoaisMinhaConta(@RequestParam("nome") String nome, @RequestParam("email") String email,
			DadosPessoais dados, Model model) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();
		UsuarioDao dao3 = new UsuarioDao();

		Usuario usuario = dao3.buscarPorId(dados.getUsuario().getIdUsuario());
		usuario.setNome(nome);
		usuario.setEmail(email);

		dao.alterar(dados);
		// dao2.alterar(endereco);
		// dao3.alterar(usuario);

		model.addAttribute("msg", "Dados Alterados com sucesso!");

		return "prestador/minhaConta";
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("alterarDadosEndereco")
	public String alterarMinhaContaEndereco(Endereco endereco, Model model) {

		EnderecoDao dao2 = new EnderecoDao();

		dao2.alterar(endereco);

		model.addAttribute("msg", "Dados Alterados com sucesso!");

		return "prestador/minhaConta";
	}

	// metodo para filtrar cidade por estado
	@RequestMapping(value = "filtrarCidade", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filtraCidade(@RequestParam Integer idEstado) {

		CidadeDao dao = new CidadeDao();
		List<Cidade> listaCidade = dao.filtrarPorEstado(idEstado);
		return new Gson().toJson(listaCidade);
	}

	// metodo para filtrar servico por categoria
	@RequestMapping(value = "filtrarServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filtraServico(@RequestParam Integer idCategoria) {

		ServicoDao dao = new ServicoDao();
		List<Servico> listaServico = dao.filtrarPorCategoria(idCategoria);
		return new Gson().toJson(listaServico);
	}

	// metodo para vincular o servico primeiro acesso no sistema
	@RequestMapping("vincularServico")
	public String primeiroAcessoCadastrarServico(Model modelCategoria, Model modelCidades, Model modelEstado,
			HttpServletRequest request) {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco enderecoPrestador = daoEndereco.buscarEnderecoUsuarioPrestador(usuario.getIdUsuario());

		CidadeDao daoCidade = new CidadeDao();
		List<Cidade> listaCidades = daoCidade.filtrarPorEstado(enderecoPrestador.getEstado().getIdEstado());

		CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoria = dao.listar();

		modelCategoria.addAttribute("listaCategoria", listaCategoria);
		modelCidades.addAttribute("listaCidades", listaCidades);
		modelEstado.addAttribute("endereco", enderecoPrestador);

		return "prestador/cadastroServicoPrimeiroAcesso";
	}

	@RequestMapping(value = "cadastrarUsuarioServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String cadastrarUsuarioServico(@RequestParam("idServico") Integer idServico,
			@RequestParam("descricao") String descricao, @RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idsCidades") String[] cidades) {

		Servico servico = new Servico();
		servico.setIdServico(idServico);
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);

		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setServico(servico);
		usuarioServico.setUsuario(usuario);
		usuarioServico.setDescricao(descricao);

		UsuarioServicoController controller = new UsuarioServicoController();

		UsuarioServico retornoIdUsuarioServico = controller.save(usuarioServico);

		CidadeAtuacaoServico atuacao = new CidadeAtuacaoServico();
		atuacao.setUsuarioServico(retornoIdUsuarioServico);
		List<Cidade> cidadesSelecionadas = new ArrayList<Cidade>();
		Cidade cidade;

		for (int i = 0; i < cidades.length; i++) {
			String id = cidades[i].replaceAll("[^0-9]", "");
			cidade = new Cidade();
			cidade.setIdCidade(Integer.parseInt(id));
			cidadesSelecionadas.add(cidade);
		}

		CidadeAtuacaoServicoController controllerAtuacao = new CidadeAtuacaoServicoController();
		controllerAtuacao.save(atuacao, cidadesSelecionadas);

		return new Gson().toJson("paginaInicialPrestador");

	}

	@RequestMapping(value = "saveServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String saveServico(@RequestParam("idServico") Integer idServico,
			@RequestParam("descricao") String descricao, @RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idsCidades") String[] cidades) {

		Servico servico = new Servico();
		servico.setIdServico(idServico);
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);

		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setServico(servico);
		usuarioServico.setUsuario(usuario);
		usuarioServico.setDescricao(descricao);

		UsuarioServicoController controller = new UsuarioServicoController();

		boolean existe = controller.existeVinculacao(idUsuario, idServico);
		if (!existe) {
			UsuarioServico retornoIdUsuarioServico = controller.save(usuarioServico);

			CidadeAtuacaoServico atuacao = new CidadeAtuacaoServico();
			atuacao.setUsuarioServico(retornoIdUsuarioServico);
			List<Cidade> cidadesSelecionadas = new ArrayList<Cidade>();
			Cidade cidade;

			for (int i = 0; i < cidades.length; i++) {
				String id = cidades[i].replaceAll("[^0-9]", "");
				cidade = new Cidade();
				cidade.setIdCidade(Integer.parseInt(id));
				cidadesSelecionadas.add(cidade);
			}

			CidadeAtuacaoServicoController controllerAtuacao = new CidadeAtuacaoServicoController();
			controllerAtuacao.save(atuacao, cidadesSelecionadas);

		}

		return new Gson().toJson(existe);

	}

	/* Incluir Pendências na contratação de serviço */

	@RequestMapping(value = "adicionarPendencias", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String adicionarPendencias(@RequestParam("mensagem") String mensagem,
			@RequestParam("idContrato") SolicitacaoContrato idContrato) {

		Pendencias dados = new Pendencias();
		dados.setMensagem(mensagem);
		dados.setSolicitacaoContrato(idContrato);

		PendenciasDao dao = new PendenciasDao();
		dao.salvar(dados);

		return new Gson().toJson("");
	}

	/* Listar Pendências na contratação de serviço */

	@RequestMapping(value = "ListarPendencias", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarPendencias() {

		PendenciasDao dao = new PendenciasDao();
		List<Pendencias> listaPendencias = dao.listar();

		return new Gson().toJson(listaPendencias);
	}
	

	@RequestMapping(value = "ListarPendenciasSolicitacao", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String ListarPendenciasSolicitacao(@RequestParam("cas") Integer id) {

		PendenciasDao dao = new PendenciasDao();
		List<Pendencias> listaPendencias = dao.buscarPendencias(id);

		return new Gson().toJson(listaPendencias);
	}


	// Deletar Pendência

	@RequestMapping(value = "apagarPendencia", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String deletarPendencia(@RequestParam("idPendencia") Integer id) {

		PendenciasDao dao = new PendenciasDao();
		dao.remover(id);

		return new Gson().toJson("");
	}

	/* Enviar Avaliação */

	@RequestMapping(value = "adicionarAvaliacao", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String adicionarAvaliacao(@RequestParam("mensagem") String mensagem,
			@RequestParam("idSolicitacao") SolicitacaoContrato idContrato, @RequestParam("estrela") int estrela) {

		Avaliacao dados = new Avaliacao();

		dados.setMensagem(mensagem);
		dados.setEstrela(estrela);
		dados.setSolicitacaoContrato(idContrato);

		AvaliacaoDao dao = new AvaliacaoDao();
		dao.salvar(dados);

		return new Gson().toJson("");
	}

	@RequestMapping(value = "verificarCodigoContrato", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String verificarCodigoContrato(@RequestParam("prefixo") String prefixo) {

		int gerar = 1000 + (int) (Math.random() * (10000 - 1000));
		String codigo1 = "WF" + prefixo + gerar;
		Contrato contrato = new Contrato();
		String codigoNovo = contrato.gerarMatricula(codigo1, prefixo);

		return new Gson().toJson(codigoNovo);

	}

	@RequestMapping(value = "salvarContrato", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String salvarContrato(@RequestParam("codigoContrato") String codigoContrato,
			@RequestParam("idProposta") Integer idProposta, @RequestParam("prazo") Integer prazo,
			@RequestParam("data") String data, @RequestParam("parcelas") Integer parcelas,
			@RequestParam("pagamento") String pagamento, @RequestParam("valor") String valor,
			@RequestParam("descricaoServico") String descricaoServico,
			@RequestParam("descricaoPagamento") String descricaoPagamento, @RequestParam("multa") Integer multa)
			throws ParseException {

		ContratoDao dao = new ContratoDao();
		SolicitacaoContratoDao dao2 = new SolicitacaoContratoDao();
		SolicitacaoContrato proposta = dao2.buscarPorId(idProposta);
		proposta.setEstagio("3");// fase contrato
		proposta.setStatus("1");// status pendente, esperando o cliente aceitar o contrato
		dao2.update(proposta);

		Contrato contrato = new Contrato();
		contrato.setAceito("0");
		contrato.setCodigoContrato(codigoContrato);
		contrato.setDescricaoServicos(descricaoServico);
		contrato.setPrazo(prazo);

		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		Date dataInicio = formato.parse(data);

		contrato.setDataInicio(dataInicio);
		contrato.setFormaPagamento(pagamento);
		contrato.setParcelas(parcelas);
		contrato.setValor(Float.parseFloat(valor));
		contrato.setDescricaoPagamento(descricaoPagamento);
		contrato.setMulta(multa);
		contrato.setSolicitacao(proposta);
		dao.salvar(contrato);

		return new Gson().toJson("detalheContratoPrestador");

	}

	// metodo para redirecionar para pagina detalhe contrato
	@RequestMapping("detalheContratoPrestador")
	public String detalheContratoPrestador(@RequestParam("cas") Integer codigoSolicitacao, Model model1, Model model2,
			Model model3, Model model4, Model model5, Model model6) {

		ContratoDao daoContrato = new ContratoDao();
		Contrato contrato = daoContrato.buscarContratoPorSolicitacao(codigoSolicitacao);

		SolicitacaoContratoDao daoSolicitacao = new SolicitacaoContratoDao();
		SolicitacaoContrato solicitacao = daoSolicitacao
				.buscarPorId(contrato.getSolicitacao().getIdSolicitacaoContrato());

		DadosPessoaisDao daoDados = new DadosPessoaisDao();
		DadosPessoais clienteDados = daoDados.buscarDadosPessoaisUsuario(solicitacao.getUsuario().getIdUsuario());
		DadosPessoais prestadorDados = daoDados
				.buscarDadosPessoaisUsuario(solicitacao.getUsuarioServico().getUsuario().getIdUsuario());

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco clienteEndereco = solicitacao.getEndereco();
		Endereco prestadorEndereco = daoEndereco
				.buscarEnderecoUsuario(solicitacao.getUsuarioServico().getUsuario().getIdUsuario());

		model1.addAttribute("contrato", contrato);
		model2.addAttribute("solicitacao", solicitacao);
		model3.addAttribute("clienteDados", clienteDados);
		model4.addAttribute("prestadorDados", prestadorDados);
		model5.addAttribute("clienteEndereco", clienteEndereco);
		model6.addAttribute("prestadorEndereco", prestadorEndereco);

		return "prestador/detalheContrato";
	}

	// Método para cancelar pedido

	@RequestMapping(value = "cancelarPedidoPrestador", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String cancelarPedidoCliente(@RequestParam("cas") Integer idProposta, Model model) {

		SolicitacaoContratoDao dao2 = new SolicitacaoContratoDao();
		SolicitacaoContrato proposta = dao2.buscarPorId(idProposta);
		proposta.setEstagio("0");// fase contrato
		proposta.setStatus("0");// status pendente, esperando o cliente aceitar o contrato
		proposta.setConvite("0");
		dao2.update(proposta);

		return new Gson().toJson("paginaInicialPrestador");

	}

	// Método para cancelar pedido

	@RequestMapping(value = "aceitouContrato", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String aceitouContrato(@RequestParam("cas") Integer idProposta, Model model) {

		ContratoDao dao = new ContratoDao();
		Contrato con = dao.aceitouContrato(idProposta);

		if (con == null) {
			return new Gson().toJson("0");
		} else {
			return new Gson().toJson("1");
		}

	}

	// Método para finalizar contrato

	@RequestMapping(value = "finalizarContrato", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String finalizarContrato(@RequestParam("cas") Integer idProposta, Model model) {

		SolicitacaoContratoDao dao2 = new SolicitacaoContratoDao();
		SolicitacaoContrato proposta = dao2.buscarPorId(idProposta);
		proposta.setEstagio("5");// fase finalizar contrato
		proposta.setStatus("2");// status finalizado,
		dao2.update(proposta);

		return new Gson().toJson("");

	}
	
	//Método para alterar a imagem
	@RequestMapping("alteraImagemPrestador")
	public String save(@RequestParam("idUsuario") Integer IdUsuario, @RequestParam("file") MultipartFile imagem, Model model) {
		
		UsuarioDao dao = new UsuarioDao(); 
		Usuario usuario = dao.buscarPorId(IdUsuario);
		
		if (Util.fazerUploadImagem(imagem)) {
			  usuario.setFoto(Util.obterMomentoAtual() + " - " +
			 imagem.getOriginalFilename()); 
		} 
			
		
		dao.alterar(usuario);
		
		model.addAttribute("mensagemFoto", "Foto Atualizada com sucesso!");
		
		return "forward:minhaConta";
		
		
	}



}
