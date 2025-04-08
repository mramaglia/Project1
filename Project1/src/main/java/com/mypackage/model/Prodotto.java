package com.mypackage.model;

public class Prodotto {
	
	private String nome;
	private String descrizione;
	private int prezzo;
	private int quantita;
	private String immagine;
	private String categoria;
	
	public Prodotto() {
		
	}
	
	public Prodotto(String nome, String descrizione, int prezzo, int quantita, String immagine, String categoria) {
		this.nome = nome;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.quantita = quantita;
		this.immagine = immagine;
		this.categoria = categoria;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	
	
}
