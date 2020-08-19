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
@Table(name = "avaliacao")
public class Avaliacao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idAvaliacao;
	
	@Column
	private String mensagem;
	
	@Column
	private int estrela;
	
	@Column(name="data_postagem")
	private Date dataPostagem;
		
	@ManyToOne
	@JoinColumn(name="fk_solicitacao_contrato")
	private SolicitacaoContrato solicitacaoContrato;

	
	public int getIdAvaliacao() {
		return idAvaliacao;
	}

	public void setIdAvaliacao(int idAvaliacao) {
		this.idAvaliacao = idAvaliacao;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public int getEstrela() {
		return estrela;
	}

	public void setEstrela(int estrela) {
		this.estrela = estrela;
	}

	public Date getDataPostagem() {
		return dataPostagem;
	}

	public void setDataPostagem(Date dataPostagem) {
		this.dataPostagem = dataPostagem;
	}

	public SolicitacaoContrato getSolicitacaoContrato() {
		return solicitacaoContrato;
	}

	public void setSolicitacaoContrato(SolicitacaoContrato solicitacaoContrato) {
		this.solicitacaoContrato = solicitacaoContrato;
	}


	
	
	
}
