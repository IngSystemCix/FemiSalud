<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 28/10/2024
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div class="container">
        <div class="video_player">
            <video preload="metadata" class="main-video">
                <source src="video.mp4" size="480" type="video/mp4">
                <source src="video.mp4" size="720" type="video/mp4">
                <source src="video.mp4" size="1080" type="video/mp4">
            </video>
            <img src="femisalud.webp" alt="watermark" class="watermark">
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/assets/js/player.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/css/stylePlayer.css" defer></script>