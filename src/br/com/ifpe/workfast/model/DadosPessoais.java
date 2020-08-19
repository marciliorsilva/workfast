package br.com.ifpe.workfast.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "dado_pessoal")
public class DadosPessoais {
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idDadosPessoais;
	@Column
	private String nomeFantasia;
	
	@Column
	private String razaoSocial;
	
	@Column
	private String cpfCnpj;
	
	@Column
	private String rgIe;
	
	@Column
	private String sexo;
	
	@Column
	private Date dataNascimento;
	
	@Column
	private String telefone;
	
	@Column
	private String celular;
	
	
	@ManyToOne
	@JoinColumn(name = "fk_usuario")
	private Usuario usuario;


	public int getIdDadosPessoais() {
		return idDadosPessoais;
	}


	public void setIdDadosPessoais(int idDadosPessoais) {
		this.idDadosPessoais = idDadosPessoais;
	}


	public String getNomeFantasia() {
		return nomeFantasia;
	}


	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}


	public String getRazaoSocial() {
		return razaoSocial;
	}


	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}


	public String getCpfCnpj() {
		return cpfCnpj;
	}


	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}


	public String getRgIe() {
		return rgIe;
	}


	public void setRgIe(String rgIe) {
		this.rgIe = rgIe;
	}


	public String getSexo() {
		return sexo;
	}


	public void setSexo(String sexo) {
		this.sexo = sexo;
	}


	public Date getDataNascimento() {
		return dataNascimento;
	}


	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}


	public String getTelefone() {
		return telefone;
	}


	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}


	public String getCelular() {
		return celular;
	}


	public void setCelular(String celular) {
		this.celular = celular;
	}


	public Usuario getUsuario() {
		return usuario;
	}


	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	
	
}
