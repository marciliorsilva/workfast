package br.com.ifpe.workfast.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tipo_acesso")
public class TipoAcesso {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idTipoAcesso;
	
	@Column
	private String descricao;
	
	private final static String TIPO_CLIENTE = "Cliente";
	
	private final static String TIPO_PRESTADOR = "Prestador de Serviço";
	
	private final static String TIPO_ADMINISTRADOR = "Administrador";
	
	
	public int getIdTipoAcesso() {
		return idTipoAcesso;
	}
	public void setIdTipoAcesso(int idTipoAcesso) {
		this.idTipoAcesso = idTipoAcesso;
	}
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public static String getTipoCliente() {
		return TIPO_CLIENTE;
	}
	
	public static String getTipoPrestador() {
		return TIPO_PRESTADOR;
	}
	
	public static String getTipoAdministrador() {
		return TIPO_ADMINISTRADOR;
	}
	
	
	
	
}
