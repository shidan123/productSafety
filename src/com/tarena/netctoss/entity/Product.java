package com.tarena.netctoss.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;


public class Product implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String product_id;
	private String product_name;
	private String product_weight;
	private String product_area;
	private String product_brand;
	private String safety_index;
	private Timestamp createDate;
	private String expireDate;
	private String energy;
	private String protein;
	private String fat;
	private String carbohydrate;
	private String sodium;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}
	public String getProduct_area() {
		return product_area;
	}
	public void setProduct_area(String product_area) {
		this.product_area = product_area;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public String getSafety_index() {
		return safety_index;
	}
	public void setSafety_index(String safety_index) {
		this.safety_index = safety_index;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public String getEnergy() {
		return energy;
	}
	public void setEnergy(String energy) {
		this.energy = energy;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}
	public String getFat() {
		return fat;
	}
	public void setFat(String fat) {
		this.fat = fat;
	}
	public String getCarbohydrate() {
		return carbohydrate;
	}
	public void setCarbohydrate(String carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	public String getSodium() {
		return sodium;
	}
	public void setSodium(String sodium) {
		this.sodium = sodium;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Product(Integer id, String product_id, String product_name,
			String product_weight, String product_area, String product_brand,
			String safety_index, Timestamp createDate, String expireDate,
			String energy, String protein, String fat, String carbohydrate,
			String sodium) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_weight = product_weight;
		this.product_area = product_area;
		this.product_brand = product_brand;
		this.safety_index = safety_index;
		this.createDate = createDate;
		this.expireDate = expireDate;
		this.energy = energy;
		this.protein = protein;
		this.fat = fat;
		this.carbohydrate = carbohydrate;
		this.sodium = sodium;
	}
	public Product() {
		super();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((carbohydrate == null) ? 0 : carbohydrate.hashCode());
		result = prime * result
				+ ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((energy == null) ? 0 : energy.hashCode());
		result = prime * result
				+ ((expireDate == null) ? 0 : expireDate.hashCode());
		result = prime * result + ((fat == null) ? 0 : fat.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((product_area == null) ? 0 : product_area.hashCode());
		result = prime * result
				+ ((product_brand == null) ? 0 : product_brand.hashCode());
		result = prime * result
				+ ((product_id == null) ? 0 : product_id.hashCode());
		result = prime * result
				+ ((product_name == null) ? 0 : product_name.hashCode());
		result = prime * result
				+ ((product_weight == null) ? 0 : product_weight.hashCode());
		result = prime * result + ((protein == null) ? 0 : protein.hashCode());
		result = prime * result
				+ ((safety_index == null) ? 0 : safety_index.hashCode());
		result = prime * result + ((sodium == null) ? 0 : sodium.hashCode());
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
		Product other = (Product) obj;
		if (carbohydrate == null) {
			if (other.carbohydrate != null)
				return false;
		} else if (!carbohydrate.equals(other.carbohydrate))
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (energy == null) {
			if (other.energy != null)
				return false;
		} else if (!energy.equals(other.energy))
			return false;
		if (expireDate == null) {
			if (other.expireDate != null)
				return false;
		} else if (!expireDate.equals(other.expireDate))
			return false;
		if (fat == null) {
			if (other.fat != null)
				return false;
		} else if (!fat.equals(other.fat))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (product_area == null) {
			if (other.product_area != null)
				return false;
		} else if (!product_area.equals(other.product_area))
			return false;
		if (product_brand == null) {
			if (other.product_brand != null)
				return false;
		} else if (!product_brand.equals(other.product_brand))
			return false;
		if (product_id == null) {
			if (other.product_id != null)
				return false;
		} else if (!product_id.equals(other.product_id))
			return false;
		if (product_name == null) {
			if (other.product_name != null)
				return false;
		} else if (!product_name.equals(other.product_name))
			return false;
		if (product_weight == null) {
			if (other.product_weight != null)
				return false;
		} else if (!product_weight.equals(other.product_weight))
			return false;
		if (protein == null) {
			if (other.protein != null)
				return false;
		} else if (!protein.equals(other.protein))
			return false;
		if (safety_index == null) {
			if (other.safety_index != null)
				return false;
		} else if (!safety_index.equals(other.safety_index))
			return false;
		if (sodium == null) {
			if (other.sodium != null)
				return false;
		} else if (!sodium.equals(other.sodium))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_weight="
				+ product_weight + ", product_area=" + product_area
				+ ", product_brand=" + product_brand + ", safety_index="
				+ safety_index + ", createDate=" + createDate + ", expireDate="
				+ expireDate + ", energy=" + energy + ", protein=" + protein
				+ ", fat=" + fat + ", carbohydrate=" + carbohydrate
				+ ", sodium=" + sodium + "]";
	}
	
}
