package br.com.ifpe.workfast.model;

public class ChatVO {
	
	private Integer idProposta;
	private Integer idPrestador;
	private Integer idCliente;
	private String nomeCLiente;
	private String nomeFantasiaCliente;
	private String nomePrestador;
	private String nomeFantasiaPrestador;
	private String tipoUsuarioPrestador;
	private String tipoUsuarioCliente;
	private String mensagem;
	private String fotoPrestador;
	private int enviadoPor;
	private String fotoCliente;
	
	public ChatVO(Integer idProposta, Integer idPrestador, Integer idCliente, String nomeCLiente,
			String nomeFantasiaCliente, String nomePrestador, String nomeFantasiaPrestador, String tipoUsuarioPrestador,
			String tipoUsuarioCliente, String mensagem, String fotoPrestador, int enviadoPor, String fotoCliente) {
		super();
		this.idProposta = idProposta;
		this.idPrestador = idPrestador;
		this.idCliente = idCliente;
		this.nomeCLiente = nomeCLiente;
		this.nomeFantasiaCliente = nomeFantasiaCliente;
		this.nomePrestador = nomePrestador;
		this.nomeFantasiaPrestador = nomeFantasiaPrestador;
		this.tipoUsuarioPrestador = tipoUsuarioPrestador;
		this.tipoUsuarioCliente = tipoUsuarioCliente;
		this.mensagem = mensagem;
		this.fotoPrestador = fotoPrestador;
		this.enviadoPor = enviadoPor;
		this.fotoCliente = fotoCliente;
	}
	public Integer getIdProposta() {
		return idProposta;
	}
	public void setIdProposta(Integer idProposta) {
		this.idProposta = idProposta;
	}
	public Integer getIdPrestador() {
		return idPrestador;
	}
	public void setIdPrestador(Integer idPrestador) {
		this.idPrestador = idPrestador;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public String getNomeCLiente() {
		return nomeCLiente;
	}
	public void setNomeCLiente(String nomeCLiente) {
		this.nomeCLiente = nomeCLiente;
	}
	public String getNomeFantasiaCliente() {
		return nomeFantasiaCliente;
	}
	public void setNomeFantasiaCliente(String nomeFantasiaCliente) {
		this.nomeFantasiaCliente = nomeFantasiaCliente;
	}
	public String getNomePrestador() {
		return nomePrestador;
	}
	public void setNomePrestador(String nomePrestador) {
		this.nomePrestador = nomePrestador;
	}
	public String getNomeFantasiaPrestador() {
		return nomeFantasiaPrestador;
	}
	public void setNomeFantasiaPrestador(String nomeFantasiaPrestador) {
		this.nomeFantasiaPrestador = nomeFantasiaPrestador;
	}
	public String getTipoUsuarioPrestador() {
		return tipoUsuarioPrestador;
	}
	public void setTipoUsuarioPrestador(String tipoUsuarioPrestador) {
		this.tipoUsuarioPrestador = tipoUsuarioPrestador;
	}
	public String getTipoUsuarioCliente() {
		return tipoUsuarioCliente;
	}
	public void setTipoUsuarioCliente(String tipoUsuarioCliente) {
		this.tipoUsuarioCliente = tipoUsuarioCliente;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	public String getFotoPrestador() {
		return fotoPrestador;
	}
	public void setFotoPrestador(String fotoPrestador) {
		this.fotoPrestador = fotoPrestador;
	}
	public String getFotoCliente() {
		return fotoCliente;
	}
	public void setFotoCliente(String fotoCliente) {
		this.fotoCliente = fotoCliente;
	}
	public int getEnviadoPor() {
		return enviadoPor;
	}
	public void setEnviadoPor(int enviadoPor) {
		this.enviadoPor = enviadoPor;
	}
	
	
	
	
	
	
	

}
