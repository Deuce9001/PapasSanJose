package reporte;

public class Producto {
    
    private String tipo;
    private int id;
    private int kgVendidos;
    private int kgEntregados;
    private int totalVentas;
    private int merma;

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getKgVendidos() {
        return kgVendidos;
    }

    public void setKgVendidos(int kgVendidos) {
        this.kgVendidos = kgVendidos;
    }

    public int getKgEntregados() {
        return kgEntregados;
    }

    public void setKgEntregados(int kgEntregados) {
        this.kgEntregados = kgEntregados;
    }

    public int getTotalVentas() {
        return totalVentas;
    }

    public void setTotalVentas(int totalVenta) {
        this.totalVentas = totalVenta;
    }

    public int getMerma() {
        return merma;
    }

    public void setMerma(int merma) {
        this.merma = merma;
    }
}
