<%@ page import="model.Film" %>
<%@ page import="java.util.*" %>

<%
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
    String judulDipilih = request.getParameter("judul");
    Film filmDipilih = null;

    if (judulDipilih != null && daftarFilm != null) {
        for (Film film : daftarFilm) {
            if (film.getJudul().equals(judulDipilih)) {
                filmDipilih = film;
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Pemesanan Tiket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <h2 class="mb-4">Form Pemesanan Tiket</h2>
        
        <!-- Dropdown Pilih Film -->
        <form method="get" action="Formpesan.jsp" class="mb-4">
            <div class="mb-3">
                <label for="judul" class="form-label">Pilih Film:</label>
                <select class="form-select" name="judul" id="judul" onchange="this.form.submit()">
                    <option value="">-- Pilih Film --</option>
                    <% if (daftarFilm != null) {
                        for (Film film : daftarFilm) { %>
                            <option value="<%= film.getJudul() %>" <%= film.getJudul().equals(judulDipilih) ? "selected" : "" %>>
                                <%= film.getJudul() %>
                            </option>
                    <%  } } %>
                </select>
            </div>
        </form>

        <!-- Form Input Pemesanan -->
        <% if (filmDipilih != null) { %>
        <form method="post" action="struk.jsp">
            <input type="hidden" name="judul" value="<%= filmDipilih.getJudul() %>">
            <input type="hidden" name="harga" value="<%= filmDipilih.getHarga() %>">
            
            <div class="mb-3">
                <label for="nama" class="form-label">Nama Pemesan:</label>
                <input type="text" class="form-control" name="nama" id="nama" required>
            </div>

            <div class="mb-3">
                <label for="jumlah" class="form-label">Jumlah Tiket:</label>
                <input type="number" class="form-control" name="jumlah" id="jumlah" required min="1">
            </div>

            <div class="mb-3">
                <label for="jam" class="form-label">Jam Tayang:</label>
                <select class="form-select" name="jam" id="jam" required>
                    <% for (String jam : filmDipilih.getJamTayang()) { %>
                        <option value="<%= jam %>"><%= jam %></option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-success">Cetak Struk</button>
        </form>
        <% } %>

        <div class="mt-4">
            <a href="index.jsp" class="btn btn-secondary">Kembali ke Daftar Film</a>
        </div>
    </div>
</body>
</html>
