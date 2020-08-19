package br.com.ifpe.workfast.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;
import br.com.ifpe.workfast.model.Cidade;
import br.com.ifpe.workfast.model.CidadeDao;
import br.com.ifpe.workfast.model.Estado;
import br.com.ifpe.workfast.model.EstadoDao;
import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;
import br.com.ifpe.workfast.model.Servico;
import br.com.ifpe.workfast.model.ServicoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;

@Controller
public class AdministradorController {

	// metodo para redirecionar para pagina inicial
	@RequestMapping("paginaInicial")
	public String paginaInical() {
		return "administrador/index";
	}

	// metodo para redirecionar para pagina de profissao(especialização)
	@RequestMapping("telaProfissao")
	public String profissao(Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> listaProfissao = dao.listar();
		model.addAttribute("listaProfissao", listaProfissao);
		return "administrador/profissao";
	}

	// metodo para redirecionar para pagina de servico
	@RequestMapping("telaServico")
	public String servico(Model model) {

		ServicoDao dao = new ServicoDao();
		List<Servico> listaServico = dao.listar();
		model.addAttribute("listaServico", listaServico);
		return "administrador/servico";
	}

	// metodo para redirecionar para pagina de categoria servico
	@RequestMapping("telaCategoriaServico")
	public String categoriaServico(Model model) {
		CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoriaServico = dao.listar();
		model.addAttribute("listaCategoriaServico", listaCategoriaServico);
		return "administrador/categoriaServico";
	}

	// metodo para redirecionar para pagina de gerenciamento de cliente
	@RequestMapping("gerenciarCliente")
	public String gerenciarCliente(Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listaUsuarioCliente = dao.listarUsuarioCliente();
		model.addAttribute("listaUsuarioCliente", listaUsuarioCliente);
		return "administrador/cliente";
	}

	// metodo para redirecionar para pagina de gerenciamento de administradores
	@RequestMapping("gerenciarAdm")
	public String gerenciarAdm(Model model, HttpServletRequest request) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		List<Usuario> listaUsuarioAdm = dao.listarUsuarioAdm(usuario);
		model.addAttribute("listaUsuarioAdm", listaUsuarioAdm);
		return "administrador/adm";
	}

	// metodo para redirecionar para pagina de gerenciamento de prestador
	@RequestMapping("gerenciarPrestador")
	public String gerenciarPrestador(Model model) {
		UsuarioDao dao = new UsuarioDao();

		List<Usuario> listaUsuarioPrestador = dao.listarUsuarioPrestador();
		model.addAttribute("listaUsuarioPrestador", listaUsuarioPrestador);
		return "administrador/prestador";
	}

	// metodo para redirecionar para pagina estado UF
	@RequestMapping("telaEstado")
	public String estadoUf(Model model) {
		EstadoDao dao = new EstadoDao();

		List<Estado> listarEstados = dao.listar();
		model.addAttribute("listarEstados", listarEstados);
		return "administrador/estado";
	}

	// metodo para redirecionar para pagina estado UF
	@RequestMapping("telaCidade")
	public String telaCidade(Model model) {
		CidadeDao dao = new CidadeDao();

		List<Cidade> listarCidades = dao.listar();
		model.addAttribute("listarCidades", listarCidades);
		return "administrador/cidade";
	}

	// metodo para redirecionar para pagina que contem o formulario de cadastro
	// de administrador
	@RequestMapping("cadastrarAdministrador")
	public String cadastrarAdm() {
		return "administrador/cadastroAdministrador";
	}

	// metodo para redirecionar para pagina que contem o formulario de cadastro
	// de profissao
	@RequestMapping("cadastrarProfissao")
	public String cadastrarProfissao() {
		return "administrador/cadastroProfissao";
	}

	// metodo para redirecionar para pagina que contem o formulario de cadastro
	// de estado
	@RequestMapping("cadastrarEstado")
	public String cadastrarEstado() {
		return "administrador/cadastroEstado";
	}

	// metodo para redirecionar para pagina que contem o formulario de cadastro
	// de servico
	@RequestMapping("cadastrarServico")
	public String cadastrarServico(Model model) {
		CategoriaServicoDao dao = new CategoriaServicoDao();

		List<CategoriaServico> listarCategoriaServico = dao.listar();
		model.addAttribute("listarCategoriaServico", listarCategoriaServico);
		return "administrador/cadastroServico";
	}

	// metodo para redirecionar para pagina que contem o formulario de cadastro
	// de servico
	@RequestMapping("cadastrarCategoriaServico")
	public String cadastrarCategoriaServico() {
		return "administrador/cadastroCategoriaServico";
	}

	// metodo para redirecionar para pagina que contem o formulario de cadastro
	// de cidade
	@RequestMapping("cadastrarCidade")
	public String cadastrarCidade(Model model) {
		EstadoDao daoEstado = new EstadoDao();
		List<Estado> listaEstado = daoEstado.listar();
		model.addAttribute("listaEstado", listaEstado);
		return "administrador/cadastroCidade";
	}

}
