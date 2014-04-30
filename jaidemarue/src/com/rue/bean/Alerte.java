package com.rue.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.users.User;
import com.google.appengine.api.datastore.KeyFactory;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.persistence.Entity;

@PersistenceCapable
public class Alerte implements Serializable{
	
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
    @Persistent
    private User owner;
	@Persistent
	private String adresse;
	@Persistent
	private Date date;
	@Persistent
	private String type;
	@Persistent
	private String image;
	@Persistent
	private String priorite;
	@Persistent
	private String commentaire;
	@Persistent
	private String coord;
	@Persistent
	private int vote=0;
	@Persistent
	private ArrayList<User> votant = new ArrayList<User>();

	public ArrayList<User> getVotant() {
		return votant;
	}

	public void setVotant(User owner) {
		votant.add(owner);
	}

	public int getVote() {
		return vote;
	}

	public void setVote() {
		this.vote = this.vote+1;
	}

	public String getCoord() {
		return coord;
	}

	public void setCoord(String coord) {
		this.coord = coord;
	}

	public String getKey() {
		return KeyFactory.keyToString(key);
	}
	
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPriorite() {
		return priorite;
	}
	public void setPriorite(String priorite) {
		this.priorite = priorite;
	}
	public String getCommentaire() {
		return commentaire;
	}
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
    public User getOwner(){
        return owner;
    }  
    public void setOwner(User owner){
        this.owner = owner;
    }
}
