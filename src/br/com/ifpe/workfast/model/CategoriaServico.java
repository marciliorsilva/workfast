package br.com.ifpe.workfast.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "categoria_servico")
public class CategoriaServico {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idCategoriaServico;
	
	@Column
	private String nome;

	public int getIdCategoriaServico() {
		return idCategoriaServico;
	}

	public void setIdCategoriaServico(int idCategoriaServico) {
		this.idCategoriaServico = idCategoriaServico;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	

}
