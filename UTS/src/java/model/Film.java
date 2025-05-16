package model;

import java.util.Arrays;
import java.util.List;

public class Film {
    private String judul;
    private String genre;
    private String poster;
    private int durasi;
    private int harga;
    private List<String> jamTayang;

    // Konstruktor
    public Film(String judul, String genre, int durasi, int harga, String[] jamTayang, String poster) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.harga = harga;
        this.jamTayang = Arrays.asList(jamTayang);
        this.poster = poster;
    }

    // Getter
    public String getJudul() {
        return judul;
    }

    public String getGenre() {
        return genre;
    }

    public String getPoster() {
        return poster;
    }

    public int getDurasi() {
        return durasi;
    }

    public int getHarga() {
        return harga;
    }

    public List<String> getJamTayang() {
        return jamTayang;
    }
}
