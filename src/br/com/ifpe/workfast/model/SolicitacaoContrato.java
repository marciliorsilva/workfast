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
@Table(name = "solicitacao_contrato")
public class SolicitacaoContrato {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idSolicitacaoContrato;
	
	@Column
	private Date dataPedido;
	
	@Column(name="status_solicitacao")
	private String status;
	
	@Column
	private String convite;
	
	@Column
	private String estagio;
	
	@Column
	private String mensagem;
	
	@ManyToOne
	@JoinColumn(name = "fk_cliente")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name = "fk_prestadorServico")
	private UsuarioServico usuarioServico;
	
	@ManyToOne
	@JoinColumn(name = "fk_endereco")
	private Endereco endereco;

	public int getIdSolicitacaoContrato() {
		return idSolicitacaoContrato;
	}

	public void setIdSolicitacaoContrato(int idSolicitacaoContrato) {
		this.idSolicitacaoContrato = idSolicitacaoContrato;
	}

	public Date getDataPedido() {
		return dataPedido;
	}

	public void setDataPedido(Date dataPedido) {
		this.dataPedido = dataPedido;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getConvite() {
		return convite;
	}

	public void setConvite(String convite) {
		this.convite = convite;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public UsuarioServico getUsuarioServico() {
		return usuarioServico;
	}

	public void setUsuarioServico(UsuarioServico usuarioServico) {
		this.usuarioServico = usuarioServico;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public String getEstagio() {
		return estagio;
	}

	public void setEstagio(String estagio) {
		this.estagio = estagio;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	
	
	
	
	
	

}
