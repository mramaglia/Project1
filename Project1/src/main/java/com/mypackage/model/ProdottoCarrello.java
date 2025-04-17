package com.mypackage.model;

public class ProdottoCarrello {
	
	private Prodotto prodotto;
	private int quantita;
	
	public ProdottoCarrello() {
		
	}
	
	public ProdottoCarrello(Prodotto prodotto, int quantita) {
		this.prodotto = prodotto;
		this.quantita = quantita;
	}


	public Prodotto getProdotto() {
		return prodotto;
	}


	public void setProdotto(Prodotto prodotto) {
		this.prodotto = prodotto;
	}


	public int getQuantita() {
		return quantita;
	}


	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	

}
