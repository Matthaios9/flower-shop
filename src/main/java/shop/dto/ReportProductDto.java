package shop.dto;

import java.math.BigDecimal;

public class ReportProductDto {
	private int idFlower;
	private String name;
	private int totalQuantity;
	private BigDecimal totalAmount;

	public ReportProductDto() {
	}

	public ReportProductDto(int idFlower, String name, int totalQuantity, BigDecimal totalAmount) {
		this.idFlower = idFlower;
		this.name = name;
		this.totalQuantity = totalQuantity;
		this.totalAmount = totalAmount;
	}

	public int getIdFlower() {
		return idFlower;
	}

	public void setIdFlower(int idFlower) {
		this.idFlower = idFlower;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}
}
