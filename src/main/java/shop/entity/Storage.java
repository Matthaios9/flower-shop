package shop.entity;

import javax.persistence.*;

@Entity
@Table(name ="Storage")
public class
Storage {
    @Id
    @GeneratedValue
    @Column(name = "idStorage", nullable = false)
    private Integer idStorage;

    @Column(name = "quantity_in")
    private int quantityIn;

    @Column(name = "quantity_remain")
    private int quantityRemain;

    @Column(name = "isLast")
    private boolean isLast;

    @Column(name = "isSell")
    private boolean isSell;

    @Transient
    private boolean isUpdate = false;

    @ManyToOne
    @JoinColumn(name="idFlower")
    private Flower flower;

    public Integer getIdStorage() {
        return idStorage;
    }

    public void setIdStorage(Integer idStorage) {
        this.idStorage = idStorage;
    }

    public int getQuantityIn() {
        return quantityIn;
    }

    public void setQuantityIn(int quantityIn) {
        this.quantityIn = quantityIn;
    }

    public int getQuantityRemain() {
        return quantityRemain;
    }

    public void setQuantityRemain(int quantityRemain) {
        this.quantityRemain = quantityRemain;
    }

    public boolean isLast() {
        return isLast;
    }

    public void setLast(boolean last) {
        isLast = last;
    }

    public boolean isSell() {
        return isSell;
    }

    public void setSell(boolean sell) {
        isSell = sell;
    }

    public Flower getFlower() {
        return flower;
    }

    public void setFlower(Flower flower) {
        this.flower = flower;
    }

    public boolean isUpdate() {
        return isUpdate;
    }

    public void setUpdate(boolean update) {
        isUpdate = update;
    }
}
