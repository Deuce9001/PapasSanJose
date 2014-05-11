package compra;

public class Compra {
    
    private int producto;
    private int kg;
    private int bultos;
    private int pu;
    private int total;

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public int getKg() {
        return kg;
    }

    public void setKg(int kg) {
        this.kg = kg;
    }

    public int getBultos() {
        return bultos;
    }

    public void setBultos(int bultos) {
        this.bultos = bultos;
    }

    public int getPu() {
        return pu;
    }

    public void setPu(int pu) {
        this.pu = pu;
    }

    public int getTotal() {
        return total;
    }
    
    public int precioTotal(){
        return bultos * pu;
    }
    
}
