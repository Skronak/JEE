package com.rue.bean;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.persistence.Entity;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.users.User;

@Entity
@PersistenceCapable
public class UserPreference {
 
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
    
    @Persistent
    private User owner;
    
    @Persistent
    private String street;
 
    public Key getKey() {
        return key;
    }
    public void setKey(Key key) {
        this.key = key;
    }
	public User getOwner() {
		return owner;
	}
	public void setOwner(User user) {
		this.owner = user;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
    
}