package br.com.ifpe.workfast.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "profissao")
public class Profissao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idProfissao;
	
	@Column
	private String nome;
	

	@Column
	private String descricao;
	
	
	public int getIdProfissao() {
		return idProfissao;
	}

	public void setIdProfissao(int idProfissao) {
		this.idProfissao = idProfissao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

 
}
