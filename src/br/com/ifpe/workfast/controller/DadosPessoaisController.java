package br.com.ifpe.workfast.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.ifpe.workfast.model.Cidade;
import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Endereco;
import br.com.ifpe.workfast.model.EnderecoDao;
import br.com.ifpe.workfast.model.Estado;
import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;
import br.com.ifpe.workfast.model.UsuarioProfissao;
import br.com.ifpe.workfast.model.UsuarioProfissaoDao;

@Controller
public class DadosPessoaisController {
	
	
	
	@RequestMapping(value = "salvarDadosPrimeiroAcessoPrestador", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String savePrestador(@RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("cpfCnpj") String cpfCnpj, @RequestParam("dataNascimento") String dataNascimento,
			@RequestParam("nomeFantasia") String nomeFantasia, @RequestParam("razaoSocial") String razaoSocial,
			@RequestParam("rgIe") String rgIe, @RequestParam("sexo") String sexo,
			@RequestParam("telefone") String telefone,@RequestParam("celular") String celular,
			@RequestParam("bairro") String bairro, @RequestParam("cep") String cep,
			@RequestParam("idCidade") Integer idCidade, @RequestParam("complemento") String complemento,
			@RequestParam("idEstado") Integer idEstado, @RequestParam("numeroCasa") String numeroCasa,
			@RequestParam("rua") String rua, @RequestParam("area") Integer idProfissao,
			@RequestParam("tipo") String tipoUsuario) throws ParseException {

		DadosPessoais dados = new DadosPessoais();
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);
		
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		
		dados.setRazaoSocial(razaoSocial);
		dados.setRgIe(rgIe);
		dados.setCelular(celular);
		dados.setCpfCnpj(cpfCnpj);
		Date data = formato.parse(dataNascimento);
		dados.setDataNascimento(data);
		dados.setNomeFantasia(nomeFantasia);
		dados.setSexo(sexo);
		dados.setTelefone(telefone);
		dados.setUsuario(usuario);
		DadosPessoaisDao dao = new DadosPessoaisDao();
		dao.salvar(dados);
		
		if(tipoUsuario == "2"){
			Profissao profissao = new Profissao();
			profissao.setIdProfissao(idProfissao);
			UsuarioProfissao  userProf = new UsuarioProfissao();
			userProf.setProfissao(profissao);
			userProf.setUsuario(usuario);
			UsuarioProfissaoDao daoUserProf = new UsuarioProfissaoDao();
			daoUserProf.salvar(userProf);
		}
		
		Cidade cidade = new Cidade();
		cidade.setIdCidade(idCidade);
		
		Estado estado = new Estado();
		estado.setIdEstado(idEstado);
		
		Endereco endereco = new Endereco();
		endereco.setBairro(bairro);
		endereco.setCep(cep);
		endereco.setCidade(cidade);
		endereco.setComplemento(complemento);
		endereco.setEstado(estado);
		endereco.setNumeroCasa(numeroCasa);
		endereco.setRua(rua);
		endereco.setUsuario(usuario);
		
		EnderecoDao daoEndereco = new EnderecoDao();
        daoEndereco.salvarEndereco(endereco);
        
		
		return new Gson().toJson("vincularServico");
		
		
		
	}
	
	@RequestMapping(value = "salvarDadosPrimeiroAcessoCliente", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String save(@RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("cpfCnpj") String cpfCnpj, @RequestParam("dataNascimento") String dataNascimento,
			@RequestParam("nomeFantasia") String nomeFantasia, @RequestParam("razaoSocial") String razaoSocial,
			@RequestParam("rgIe") String rgIe, @RequestParam("sexo") String sexo,
			@RequestParam("telefone") String telefone,@RequestParam("celular") String celular,
			@RequestParam("bairro") String bairro, @RequestParam("cep") String cep,
			@RequestParam("idCidade") Integer idCidade, @RequestParam("complemento") String complemento,
			@RequestParam("idEstado") Integer idEstado, @RequestParam("numeroCasa") String numeroCasa,
			@RequestParam("rua") String rua, @RequestParam("area") Integer idProfissao,
			@RequestParam("tipo") String tipoUsuario) throws ParseException {

		DadosPessoais dados = new DadosPessoais();
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);
		
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		
		dados.setRazaoSocial(razaoSocial);
		dados.setRgIe(rgIe);
		dados.setCelular(celular);
		dados.setCpfCnpj(cpfCnpj);
		Date data = formato.parse(dataNascimento);
		dados.setDataNascimento(data);
		dados.setNomeFantasia(nomeFantasia);
		dados.setSexo(sexo);
		dados.setTelefone(telefone);
		dados.setUsuario(usuario);
		DadosPessoaisDao dao = new DadosPessoaisDao();
		dao.salvar(dados);
		
		if(tipoUsuario == "2"){
			Profissao profissao = new Profissao();
			profissao.setIdProfissao(idProfissao);
			UsuarioProfissao  userProf = new UsuarioProfissao();
			userProf.setProfissao(profissao);
			userProf.setUsuario(usuario);
			UsuarioProfissaoDao daoUserProf = new UsuarioProfissaoDao();
			daoUserProf.salvar(userProf);
		}
		
		Cidade cidade = new Cidade();
		cidade.setIdCidade(idCidade);
		
		Estado estado = new Estado();
		estado.setIdEstado(idEstado);
		
		Endereco endereco = new Endereco();
		endereco.setBairro(bairro);
		endereco.setCep(cep);
		endereco.setCidade(cidade);
		endereco.setComplemento(complemento);
		endereco.setEstado(estado);
		endereco.setNumeroCasa(numeroCasa);
		endereco.setRua(rua);
		endereco.setUsuario(usuario);
		
		EnderecoDao daoEndereco = new EnderecoDao();
        daoEndereco.salvarEndereco(endereco);
        
		
		return new Gson().toJson("paginaInicialCliente");
		
		
		
	}
	
	
	
}
