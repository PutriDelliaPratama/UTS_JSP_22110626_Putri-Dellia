<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Film" %>

<%
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("jurnalrisa", "Horror", 150, 70000,
        new String[]{"10:00", "13:00", "16:00"},
        "photo/jurnalrisa.jpeg"));
    daftarFilm.add(new Film("Doraemon", "Cartun", 118, 55000,
        new String[]{"11:00", "14:00", "17:00"},
        "photo/Doraemon.jpg"));
    daftarFilm.add(new Film("Dilan", "Romance", 119, 48000,
        new String[]{"13:00", "16:00", "19:00"},
        "photo/Dilan.jpg"));

    session.setAttribute("daftarFilm", daftarFilm);
%>


<!DOCTYPE html>
<html>
<head>
    <title>Bioskop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <h2 class="text-center mb-5">Daftar Film Bioskop</h2>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% for (Film film : daftarFilm) { %>
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="<%= film.getPoster() %>" class="card-img-top" alt="Poster <%= film.getJudul() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= film.getJudul() %></h5>
                            <p class="card-text"><strong>Genre:</strong> <%= film.getGenre() %></p>
                            <p class="card-text"><strong>Durasi:</strong> <%= film.getDurasi() %> menit</p>
                            <p class="card-text"><strong>Harga:</strong> Rp <%= film.getHarga() %></p>
                            <p class="card-text"><strong>Jam Tayang:</strong> <%= String.join(", ", film.getJamTayang()) %></p>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
        <div class="text-center mt-5">
            <a href="Formpesan.jsp" class="btn btn-primary btn-lg">Pesan Tiket</a>
        </div>
    </div>
</body>
</html>
