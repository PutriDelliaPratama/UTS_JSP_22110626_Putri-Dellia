<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
    request.setCharacterEncoding("UTF-8");

    String nama = request.getParameter("nama");
    String judul = request.getParameter("judul");
    String jam = request.getParameter("jam");

    int jumlah = 0;
    int harga = 0;

    try {
        jumlah = Integer.parseInt(request.getParameter("jumlah"));
        harga = Integer.parseInt(request.getParameter("harga"));
    } catch (NumberFormatException e) {
        out.println("<p class='text-danger'>Data jumlah atau harga tidak valid.</p>");
    }

    int total = jumlah * harga;
    NumberFormat formatRupiah = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Struk Pemesanan Tiket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="card shadow">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">Struk Pemesanan Tiket</h4>
            </div>
            <div class="card-body">
                <p><strong>Nama Pemesan:</strong> <%= nama != null ? nama : "-" %></p>
                <p><strong>Judul Film:</strong> <%= judul != null ? judul : "-" %></p>
                <p><strong>Jam Tayang:</strong> <%= jam != null ? jam : "-" %></p>
                <p><strong>Jumlah Tiket:</strong> <%= jumlah %></p>
                <p><strong>Harga per Tiket:</strong> <%= formatRupiah.format(harga) %></p>
                <hr>
                <h5><strong>Total Bayar:</strong> <%= formatRupiah.format(total) %></h5>
            </div>
            <div class="card-footer text-center">
                <a href="index.jsp" class="btn btn-primary">Kembali ke Beranda</a>
            </div>
        </div>
    </div>
</body>
</html>
