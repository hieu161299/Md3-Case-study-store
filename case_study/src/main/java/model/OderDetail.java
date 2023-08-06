package model;

public class OderDetail {
    private int id ;
    private float priceProduct ;
    private int quantity; // số lượng sản phẩm khách mua
    private int idProduct;
    private int idOder;

    private Product product;
    private Oder oder;

    public OderDetail(int id, float priceProduct, int quantity, int idProduct, int idOder) {
        this.id = id;
        this.priceProduct = priceProduct;
        this.quantity = quantity;
        this.idProduct = idProduct;
        this.idOder = idOder;
    }
    public OderDetail( float priceProduct, int quantity, int idProduct, int idOder) {

        this.priceProduct = priceProduct;
        this.quantity = quantity;
        this.idProduct = idProduct;
        this.idOder = idOder;
    }

    public OderDetail(Product product, Oder oder) {
        this.product = product;
        this.oder = oder;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(float priceProduct) {
        this.priceProduct = priceProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdOder() {
        return idOder;
    }

    public void setIdOder(int idOder) {
        this.idOder = idOder;
    }
}
