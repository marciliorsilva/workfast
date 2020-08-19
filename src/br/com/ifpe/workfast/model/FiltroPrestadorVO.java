package br.com.ifpe.workfast.model;

public class FiltroPrestadorVO {
	

	private String servico;
	private String categoria;
	private String usuario;
	private String foto;
	private String nomeFantasia;
	private String localizacao;
	private Integer idUsuario;
	private Integer idUsuarioServico;
	private String tipo;
	private String descricaoServico;
	



	public FiltroPrestadorVO(String servico, String categoria, String usuario, String foto, String nomeFantasia,
			String localizacao, Integer idUsuario, Integer idUsuarioServico, String tipo, String descricaoServico) {
		super();
		this.servico = servico;
		this.categoria = categoria;
		this.usuario = usuario;
		this.foto = foto;
		this.nomeFantasia = nomeFantasia;
		this.localizacao = localizacao;
		this.idUsuario = idUsuario;
		this.idUsuarioServico = idUsuarioServico;
		this.tipo = tipo;
		this.descricaoServico = descricaoServico;
	}


	public String getServico() {
		return servico;
	}


	public void setServico(String servico) {
		this.servico = servico;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}


	public String getUsuario() {
		return usuario;
	}


	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	public String getFoto() {
		return foto;
	}


	public void setFoto(String foto) {
		this.foto = foto;
	}


	public String getNomeFantasia() {
		return nomeFantasia;
	}


	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}


	public String getLocalizacao() {
		return localizacao;
	}


	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}


	public Integer getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}


	public Integer getIdUsuarioServico() {
		return idUsuarioServico;
	}


	public void setIdUsuarioServico(Integer idUsuarioServico) {
		this.idUsuarioServico = idUsuarioServico;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getDescricaoServico() {
		return descricaoServico;
	}


	public void setDescricaoServico(String descricaoServico) {
		this.descricaoServico = descricaoServico;
	}
	
	
	
	
	

	

}
