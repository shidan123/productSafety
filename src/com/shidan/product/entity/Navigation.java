package com.shidan.product.entity;

import java.io.Serializable;

public class Navigation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String logoName;
	private String netAddress;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLogoName() {
		return logoName;
	}
	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}
	public String getNetAddress() {
		return netAddress;
	}
	public void setNetAddress(String netAddress) {
		this.netAddress = netAddress;
	}
	public Navigation(Integer id, String logoName, String netAddress) {
		super();
		this.id = id;
		this.logoName = logoName;
		this.netAddress = netAddress;
	}
	public Navigation() {
		super();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((logoName == null) ? 0 : logoName.hashCode());
		result = prime * result
				+ ((netAddress == null) ? 0 : netAddress.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Navigation other = (Navigation) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (logoName == null) {
			if (other.logoName != null)
				return false;
		} else if (!logoName.equals(other.logoName))
			return false;
		if (netAddress == null) {
			if (other.netAddress != null)
				return false;
		} else if (!netAddress.equals(other.netAddress))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Navigation [id=" + id + ", logoName=" + logoName
				+ ", netAddress=" + netAddress + "]";
	}
	
}