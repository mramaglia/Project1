package com.mypackage.model;

import java.sql.Timestamp;

public class Ordine {
	
	private int id_ordine;
	private int id_utente;
	private Timestamp data;
	private double prezzo;
	private String indirizzo;
	
	public Ordine() {
		
	}
	
	public Ordine(int id_ordine, int id_utente, Timestamp data, double prezzo, String indirizzo) {
		super();
		this.id_ordine = id_ordine;
		this.id_utente = id_utente;
		this.data = data;
		this.prezzo = prezzo;
		this.indirizzo = indirizzo;
	}

	public int getId_ordine() {
		return id_ordine;
	}

	public void setId_ordine(int id_ordine) {
		this.id_ordine = id_ordine;
	}

	public int getId_utente() {
		return id_utente;
	}

	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}

	public Timestamp getData() {
		return data;
	}

	public void setData(Timestamp data) {
		this.data = data;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	
	

}
