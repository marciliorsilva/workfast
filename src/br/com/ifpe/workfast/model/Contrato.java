package br.com.ifpe.workfast.model;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "contrato")
public class Contrato {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer idContrato; 
	
	@Column
	private String codigoContrato; 
	
	@Column
	private Date dataInicio;
	
	@Column
	private int prazo; 
	
	@Column
	private String descricaoServicos; 
	
	@Column
	private String formaPagamento;
	
	@Column
	private float valor; 
	
	@Column
	private int parcelas; 
	
	@Column
	private String descricaoPagamento; 
	
	@Column
	private int multa;
	
	@Column
	private String aceito; 
	
	@ManyToOne
	@JoinColumn(name = "fk_solicitacao_contrato")
	private SolicitacaoContrato solicitacao;

	public Integer getIdContrato() {
		return idContrato;
	}

	public void setIdContrato(Integer idContrato) {
		this.idContrato = idContrato;
	}

	public String getCodigoContrato() {
		return codigoContrato;
	}

	public void setCodigoContrato(String codigoContrato) {
		this.codigoContrato = codigoContrato;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getDescricaoServicos() {
		return descricaoServicos;
	}

	public void setDescricaoServicos(String descricaoServicos) {
		this.descricaoServicos = descricaoServicos;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public float getValor() {
		return valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public int getParcelas() {
		return parcelas;
	}

	public void setParcelas(int parcelas) {
		this.parcelas = parcelas;
	}

	public String getDescricaoPagamento() {
		return descricaoPagamento;
	}

	public void setDescricaoPagamento(String descricaoPagamento) {
		this.descricaoPagamento = descricaoPagamento;
	}

	public int getMulta() {
		return multa;
	}

	public void setMulta(int multa) {
		this.multa = multa;
	}

	public String getAceito() {
		return aceito;
	}

	public void setAceito(String aceito) {
		this.aceito = aceito;
	}

	public SolicitacaoContrato getSolicitacao() {
		return solicitacao;
	}

	public void setSolicitacao(SolicitacaoContrato solicitacao) {
		this.solicitacao = solicitacao;
	}
	
	
	
	public int getPrazo() {
		return prazo;
	}

	public void setPrazo(int prazo) {
		this.prazo = prazo;
	}

	public String gerarMatricula(String codigo, String pre) {
		ContratoDao dao = new ContratoDao();
		
		Contrato contrato = dao.buscarCodigoContrato(codigo);
		String codigo1;
		if(contrato == null) {
			
			return codigo;
			
		}else {
			int gerar = 1000 + (int)(Math.random() * (10000 - 1000));
			codigo1 = "WF"+pre+gerar;
			return this.gerarMatricula(codigo1, pre);
		}
		
		
		
		
	}
	
	
	
	
}
