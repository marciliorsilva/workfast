package br.com.ifpe.workfast.controller;

import java.text.ParseException;
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

import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;
import br.com.ifpe.workfast.model.ChatSolicitacao;
import br.com.ifpe.workfast.model.ChatSolicitacaoDao;
import br.com.ifpe.workfast.model.Cidade;
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
import br.com.ifpe.workfast.model.SolicitacaoContrato;
import br.com.ifpe.workfast.model.SolicitacaoContratoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;
import br.com.ifpe.workfast.model.UsuarioServico;
import br.com.ifpe.workfast.model.UsuarioServicoDao;
import br.com.ifpe.workfast.util.Util;

@Controller
public class ClienteController {
	// metodo para redirecionar para pagina inicial
	@RequestMapping("paginaInicialCliente")
	public String paginaInical(Model modelEstado, Model modelCategoria, Model modelEndereco,
			HttpServletRequest request) {
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		EstadoDao daoEstado = new EstadoDao();
		EnderecoDao dao = new EnderecoDao();
		CategoriaServicoDao daoCategoria = new CategoriaServicoDao();
		List<Endereco> endereco = dao.listarEnderecoCliente(usuario.getIdUsuario());

		List<Estado> listaEstado = daoEstado.listar();
		List<CategoriaServico> listaCategoria = daoCategoria.listar();

		modelEndereco.addAttribute("listaEndereco", endereco);
		modelEstado.addAttribute("listaEstado", listaEstado);
		modelCategoria.addAttribute("listaCategoria", listaCategoria);

		return "cliente/index";
	}

	// metodo para redirecionar para o perfil do cliente
	@RequestMapping("minhaContaCliente")
	public String perfil(Model model, HttpServletRequest request) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		DadosPessoais dados = dao.buscarDadosPessoaisUsuario(usuario.getIdUsuario());
		model.addAttribute("dadosPessoais", dados);

		return "cliente/minhaConta";

	}
	
	@RequestMapping("ajudaCliente")
	public String Ajuda() {
		
		return "cliente/ajuda";

	}

	// metodo para redirecionar para o perfil do cliente
	@RequestMapping("adicionarEndereco")
	public String adicionarEndereco(Model model, Model modelEstado, Model modelCidade) {

		EstadoDao daoEstado = new EstadoDao();
		CidadeDao daoCidade = new CidadeDao();
		List<Estado> listaEstado = daoEstado.listar();
		List<Cidade> listaCidade = daoCidade.listar();
		modelEstado.addAttribute("listaEstado", listaEstado);
		modelCidade.addAttribute("listaCidade", listaCidade);

		return "cliente/adicionarEndereco";

	}

	// Método para salvar o endereço do usuário

	@RequestMapping(value = "salvarEndereco", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String salvarEndereco(@RequestParam("cep") String cep, @RequestParam("bairro") String bairro,
			@RequestParam("cidade") Cidade cidade, @RequestParam("estado") Estado estado, 
			@RequestParam("rua") String rua, @RequestParam("complemento") String complemento, @RequestParam("numeroCasa") String numeroCasa,
			@RequestParam("idUsuario") Usuario idUsuario) throws ParseException{

		EnderecoDao dao = new EnderecoDao();
		Endereco end = new Endereco();
		
		end.setBairro(bairro);
		end.setCep(cep);
		end.setCidade(cidade);
		end.setEstado(estado);
		end.setNumeroCasa(numeroCasa);
		end.setComplemento(complemento);
		end.setRua(rua);
		end.setUsuario(idUsuario);
		
		dao.salvarEndereco(end);

		return new Gson().toJson("");

	}

	// Método para listar todos os endereço do cliente
	@RequestMapping("meuEnderecos")
	public String listarEndereco(Model model, HttpServletRequest request) {

		EnderecoDao dao = new EnderecoDao();
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		List<Endereco> endereco = dao.listarEnderecoCliente(usuario.getIdUsuario());

		model.addAttribute("listaEndereco", endereco);

		return "cliente/meuEnderecos";

	}

	// Método que pegara os dados do endereço para enviar para uma página de
	// edicação
	@RequestMapping("editarEnderecoCliente")
	public String edit(@RequestParam("id") Integer id, Model model, Model modelEstado, Model modelCidade) {

		EnderecoDao dao = new EnderecoDao();
		Endereco endereco = dao.buscarPorId(id);
		EstadoDao daoEstado = new EstadoDao();
		CidadeDao daoCidade = new CidadeDao();
		List<Estado> listaEstado = daoEstado.listar();
		List<Cidade> listaCidade = daoCidade.listar();

		modelEstado.addAttribute("listaEstado", listaEstado);
		modelCidade.addAttribute("listaCidade", listaCidade);
		model.addAttribute("endereco", endereco);

		return "cliente/alterarEndereco";
	}

	// Método que fará a alteração do endereço
	@RequestMapping("atulizarEndereco")
	public String update(Endereco endereco, Model model) {
		EnderecoDao dao = new EnderecoDao();
		dao.alterar(endereco);

		model.addAttribute("mensagem", "Endereco Alterado com Sucesso !");

		return "cliente/alterarEndereco";
	}

	// Método para apagar o endereço
	@RequestMapping("deleteEnderecoCliente")
	public String delete(@RequestParam("id") Integer id, Model model) {

		EnderecoDao dao = new EnderecoDao();
		dao.remover(id);

		model.addAttribute("mensagemRemocao", "Endereco Removido com Sucesso");
		return "forward:meuEnderecos";
	}

	// Método para abrir lista de servicos solicitados pendentes
	@RequestMapping("servicoSolicitadosPendentes")
	public String listaServicoSolicitadosPendentes(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaPendentes = dao.listarPedidosPendentesCliente(idUsuario);
		System.out.println("-------------------" + listaPendentes.size());
		model.addAttribute("listaPendentes", listaPendentes);

		return "cliente/solicitacoesPendentes";

	}

	// Método para abrir lista de servicos solicitados pendentes
	@RequestMapping("servicoSolicitadosAndamento")
	public String listaServicoSolicitadosAndamento(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaAndamento = dao.listarPedidosAndamentosCliente(idUsuario);
		model.addAttribute("listaAndamento", listaAndamento);

		return "cliente/solicitacoesEmAndamento";

	}

	// Método para abrir lista de servicos solicitados pendentes
	@RequestMapping("servicoSolicitadosCancelado")
	public String listaServicoSolicitadosCancelado(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaCancelados = dao.listarPedidosCanceladosCliente(idUsuario);
		model.addAttribute("listaCancelados", listaCancelados);

		return "cliente/solicitacoesCancelados";

	}

	// Método para abrir lista de servicos solicitados pendentes
	@RequestMapping("servicoSolicitadosFinalizado")
	public String listaServicoSolicitadosFinalizado(@RequestParam("cas") Integer idUsuario, Model model) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> listaFinalizado = dao.listarPedidosFinalizadosCliente(idUsuario);
		model.addAttribute("listaFinalizado", listaFinalizado);

		return "cliente/solicitacoesFinalizados";

	}

	// Método para abrir o primeiro estágio do pedido
	@RequestMapping("solicitacaoServico")
	public String solicitacaoServico(@RequestParam("id") Integer idUsuarioServico, Model model, Model model2,
			Model model3, Model model4, HttpServletRequest request) {

		UsuarioServicoDao dao2 = new UsuarioServicoDao();
		DadosPessoaisDao dao3 = new DadosPessoaisDao();

		UsuarioServico usuarioServico = dao2.buscarPorId(idUsuarioServico);
		DadosPessoais dados = dao3.buscarDadosPessoaisUsuario(usuarioServico.getUsuario().getIdUsuario());
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		EnderecoDao dao = new EnderecoDao();
		List<Endereco> lista = dao.listarEnderecoCliente(usuario.getIdUsuario());
		model2.addAttribute("idUsuarioServico", idUsuarioServico);
		model.addAttribute("listaEndereco", lista);
		model3.addAttribute("usuarioServico", usuarioServico);
		model4.addAttribute("dados", dados);

		return "cliente/solicitacaoServico";

	}

	// verificar estagios da solicitacao
	@RequestMapping(value = "detalheSolicitacao", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String verificandoDetalheSolicitacao(@RequestParam("cas") Integer idSolicitacao, Model model) {

		String encaminhar = "";
		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		SolicitacaoContrato solicitacao = dao.buscarPorId(idSolicitacao);

		if (solicitacao.getEstagio().equals("1") && solicitacao.getStatus().equals("1")
				&& solicitacao.getConvite().equals("0")) {

			encaminhar = "PrimeiroEstagio";

		} else if (solicitacao.getEstagio().equals("2") && solicitacao.getStatus().equals("1")
				&& solicitacao.getConvite().equals("1")) {
			encaminhar = "SegundoEstagio";

		} else if (solicitacao.getEstagio().equals("3") && solicitacao.getStatus().equals("1")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "TerceiroEstagio";

		} else if (solicitacao.getEstagio().equals("4") && solicitacao.getStatus().equals("3")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "QuartoEstagio";

		} else if (solicitacao.getEstagio().equals("5") && solicitacao.getStatus().equals("2")
				&& solicitacao.getConvite().equals("1")) {

			encaminhar = "QuintoEstagio";
		} else {
			encaminhar = "paginaInicialCliente";
		}

		return new Gson().toJson(encaminhar);

	}

	// Método para abrir o primeiro estágio do pedido
	@RequestMapping("PrimeiroEstagio")
	public String PrimeiroEstagioPedido(Model model) {

		return "cliente/1_estagio";

	}

	// Método para abrir o segundo estágio do pedido
	@RequestMapping(value = "enviarSolicitacaoContrato", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String cadastrarSolicitacaoContrato(@RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idEndereco") Integer idEndereco, @RequestParam("idUsuarioServico") Integer idUsuarioServico,
			@RequestParam("mensagem") String mensagem) {
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);
		Endereco endereco = new Endereco();
		endereco.setId(idEndereco);
		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setIdUsuarioServico(idUsuarioServico);
		Date data = new Date();

		SolicitacaoContrato solicitacao = new SolicitacaoContrato();
		solicitacao.setEndereco(endereco);
		solicitacao.setUsuario(usuario);
		solicitacao.setUsuarioServico(usuarioServico);
		solicitacao.setStatus("1");
		solicitacao.setConvite("0");
		solicitacao.setDataPedido(data);
		solicitacao.setEstagio("1");
		solicitacao.setMensagem(mensagem);

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		dao.salvar(solicitacao);

		return new Gson().toJson("sent");

	}

	// Método para abrir o segundo estágio do pedido
	@RequestMapping(value = "pedidoSolicitado", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String pedidoSolicitado(@RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idEndereco") Integer idEndereco,
			@RequestParam("idUsuarioServico") Integer idUsuarioServico) {

		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		SolicitacaoContrato obj = dao.existeVinculacao(idUsuario, idUsuarioServico, idEndereco);
		if (obj == null) {
			return new Gson().toJson("notExist");
		} else {

			return new Gson().toJson("exist");
		}

	}

	// Método para abrir o segundo estágio do pedido
	@RequestMapping("SegundoEstagio")
	public String SegundoEstagioPedido(@RequestParam("cas") Integer idSolicitacao, Model model) {
		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		ListaPedidosPendentesVO solicitacao = dao.buscarPedidoPendentePrestador(idSolicitacao);
		model.addAttribute("proposta", solicitacao);
		return "cliente/2_estagio";

	}

	// Método para abrir o terceiro estágio do pedido
	@RequestMapping("TerceiroEstagio")
	public String TerceiroEstagioPedido(@RequestParam("cas") Integer codigoSolicitacao, Model model1, Model model2,
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
		
		return "cliente/3_estagio";

	}

	// Método para abrir o Quarto estágio do pedido
	@RequestMapping("QuartoEstagio")
	public String QuartoEstagioPedido(Model modelPendencias,@RequestParam("cas") Integer idSolicitacao, Model model, Model model1, Model model2,
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
		PendenciasDao dao = new PendenciasDao();
		List<Pendencias> listaPencias = dao.buscarPendencias(11);

		modelPendencias.addAttribute("listaPencias", listaPencias);

		return "cliente/4_estagio";

	}

	// Método para abrir o Quinto estágio do pedido
	@RequestMapping("QuintoEstagio")
	public String QuintoEstagioPedido() {

		return "cliente/5_estagio";

	}

	// Método para encaminhar para o cadastro de primeiro acesso do tipo fisico
	@RequestMapping("cadastroClienteFisico")
	public String cadastroClienteFisico(Model model) {

		EstadoDao dao = new EstadoDao();
		List<Estado> lista = dao.listar();
		model.addAttribute("listaEstado", lista);
		return "cliente/cadastroClienteFisico";

	}

	// Método para encaminhar para o cadastro de primeiro acesso do tipo juridico
	@RequestMapping("cadastroClienteJuridico")
	public String cadastroClienteJuridico(Model model, Model model2) {

		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		EstadoDao daoEstado = new EstadoDao();
		List<Estado> listaEstado = daoEstado.listar();
		model2.addAttribute("listaEstado", listaEstado);
		model.addAttribute("listaAtaucao", lista);
		return "cliente/cadastroClienteJuridico";

	}

	// chat
	@RequestMapping(value = "enviarMensagemChatCliente", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String enviarMensagem(@RequestParam("msg") String mensagem,
			@RequestParam("idCliente") Integer idCliente, @RequestParam("idPrestador") Integer idPrestador,
			@RequestParam("idProposta") Integer idProposta) {

		Usuario userSend = new Usuario();
		Usuario userReceive = new Usuario();
		userSend.setIdUsuario(idCliente);
		userReceive.setIdUsuario(idPrestador);

		SolicitacaoContrato proposta = new SolicitacaoContrato();
		proposta.setIdSolicitacaoContrato(idProposta);

		ChatSolicitacaoDao dao = new ChatSolicitacaoDao();

		ChatSolicitacao chat = new ChatSolicitacao();
		chat.setMensagem(mensagem);
		chat.setUsuarioPrestador(userReceive);
		chat.setUsuarioCliente(userSend);
		chat.setEnviadoPor(idCliente);
		chat.setSolicitacaoContrato(proposta);

		dao.publicarMensagem(chat);

		return new Gson().toJson("send");
	}

	// Método para cancelar contrato

	@RequestMapping(value = "cancelarContrato", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String cancelarContrato(@RequestParam("cas") Integer idProposta, Model model) {
		ContratoDao dao = new ContratoDao();
		Contrato con = dao.buscarContratoPorSolicitacao(idProposta);
		dao.removerContratoPorSolicitacao(con.getIdContrato());

		SolicitacaoContratoDao dao2 = new SolicitacaoContratoDao();
		SolicitacaoContrato proposta = dao2.buscarPorId(idProposta);
		proposta.setEstagio("2");// fase contrato
		proposta.setStatus("1");// status pendente, esperando o cliente aceitar o contrato
		dao2.update(proposta);

		return new Gson().toJson("SegundoEstagio?cas=" + idProposta);

	}

	// Método para cancelar pedido

	@RequestMapping(value = "cancelarPedidoCliente", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String cancelarPedidoCliente(@RequestParam("cas") Integer idProposta, Model model) {

		SolicitacaoContratoDao dao2 = new SolicitacaoContratoDao();
		SolicitacaoContrato proposta = dao2.buscarPorId(idProposta);
		proposta.setEstagio("0");// fase contrato
		proposta.setStatus("0");// status pendente, esperando o cliente aceitar o contrato
		proposta.setConvite("0");
		dao2.update(proposta);

		return new Gson().toJson("paginaInicialCliente");

	}

	// Método para aceitar contrato

	@RequestMapping(value = "aceitarContratoCliente", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String aceitarContratoCliente(@RequestParam("cas") Integer idProposta, Model model) {
		ContratoDao dao = new ContratoDao();
		Contrato con = dao.buscarContratoPorSolicitacao(idProposta);
		con.setAceito("1");
		dao.alterar(con);

		SolicitacaoContratoDao dao2 = new SolicitacaoContratoDao();
		SolicitacaoContrato proposta = dao2.buscarPorId(idProposta);
		proposta.setEstagio("4");// fase contrato
		proposta.setStatus("3");// status pendente, esperando o cliente aceitar o contrato
		dao2.update(proposta);
		

		return new Gson().toJson("");

	}
	/*
	 //Método para alterar foto com ajax
	  
	  @RequestMapping(value = "alteraImagem", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE) 
	  public @ResponseBody String alteraFotoClciente(@RequestParam("idUsuario") Integer IdUsuario, @RequestParam("file") MultipartFile imagem) {
	  
	  UsuarioDao dao = new UsuarioDao(); 
	  Usuario usuario = dao.buscarPorId(IdUsuario);
	  
	  if (Util.fazerUploadImagem(imagem)) {
		  usuario.setFoto(Util.obterMomentoAtual() + " - " +
		  imagem.getOriginalFilename()); 
	  }  
	  
	  dao.alterar(usuario);
	  
	  return new Gson().toJson("");
	  
	  }
	 
	  */

	@RequestMapping("alteraImagem")
	public String save(@RequestParam("idUsuario") Integer IdUsuario, @RequestParam("file") MultipartFile imagem, Model model) {
		
		UsuarioDao dao = new UsuarioDao(); 
		Usuario usuario = dao.buscarPorId(IdUsuario);
		
		if (Util.fazerUploadImagem(imagem)) {
			  usuario.setFoto(Util.obterMomentoAtual() + " - " +
			 imagem.getOriginalFilename()); 
		} 
			
		
		dao.alterar(usuario);
		
		model.addAttribute("mensagemFoto", "Foto Atualizada com sucesso!");
		
		return "forward:minhaContaCliente";
		
		
	}
		/*
	@RequestMapping(value = "alterarDados", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String alterarDadosPessoais(@RequestParam("cpf") String cpf,
			@RequestParam("idUsuario2") Integer idUsuario, @RequestParam("nome") String nome,
			@RequestParam("rg") String rg, @RequestParam("senha") String senha, @RequestParam("sexo") String sexo,
			@RequestParam("dataNascimento") Date dataNascimento, @RequestParam("email") String email) {

		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = dao.buscarPorId(idUsuario);

		DadosPessoaisDao dados = new DadosPessoaisDao();
		DadosPessoais dadosPessoais = dados.buscarDadosPessoaisUsuario(idUsuario);

		usuario.setIdUsuario(idUsuario);
		usuario.setEmail(email);
		usuario.setNome(nome);
		usuario.setSenha(senha);
		usuario.setEmail(email);

		dadosPessoais.setDataNascimento(dataNascimento);
		dadosPessoais.setCpfCnpj(cpf);
		dadosPessoais.setRgIe(rg);
		dadosPessoais.setSexo(sexo);

		dados.alterar(dadosPessoais);
		dao.alterar(usuario);

		return new Gson().toJson("");

	}
	*/
	  
		@RequestMapping("alterarDadosPessoaisCliente")
		public String alterarDadosPessoaisCliente(@RequestParam("cpf") String cpf,
				@RequestParam("idUsuario") Integer idUsuario, @RequestParam("nome") String nome,
				@RequestParam("rgIe") String rg, @RequestParam("senha") String senha, @RequestParam("sexo") String sexo,
				@RequestParam("dataNascimento") Date dataNascimento, @RequestParam("email") String email, Model model) {

			UsuarioDao dao = new UsuarioDao();
			Usuario usuario = dao.buscarPorId(idUsuario);

			DadosPessoaisDao dados = new DadosPessoaisDao();
			DadosPessoais dadosPessoais = dados.buscarDadosPessoaisUsuario(idUsuario);

			usuario.setEmail(email);
			usuario.setNome(nome);
			usuario.setSenha(senha);
			usuario.setEmail(email);

			dadosPessoais.setDataNascimento(dataNascimento);
			dadosPessoais.setCpfCnpj(cpf);
			dadosPessoais.setRgIe(rg);
			dadosPessoais.setSexo(sexo);

			dados.alterar(dadosPessoais);
			dao.alterar(usuario);
			
			model.addAttribute("mensagem", "Dados Atualizados com sucesso!");

			return "forward:minhaContaCliente";

		}

}