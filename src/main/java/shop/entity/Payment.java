package shop.entity;

import javax.persistence.*;

@Entity
@Table(name ="Payment")
public class Payment {
	@Id
	@GeneratedValue
	@Column(name = "idPayment", nullable = false)
	private Integer idPayment;

	@Column(name = "paymentName")
	private String paymentName;

	@Column(name = "status")
	private int status;

	public Integer getIdPayment() {
		return idPayment;
	}

	public void setIdPayment(Integer idPayment) {
		this.idPayment = idPayment;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
