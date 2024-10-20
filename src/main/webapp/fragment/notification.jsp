<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 13/10/2024
  Time: 04:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="max-w-sm mx-auto mt-10">
    <!-- Encabezado de notificaciones -->
    <div class="bg-blue-50 p-4 rounded-t-lg flex justify-between items-center">
        <h2 class="text-2xl font-bold">Notificaciones</h2>
        <div class="relative">
            <button class="relative">
                <!-- Ícono de campanita de notificación -->
                <svg width="40" height="35" viewBox="0 0 40 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M40 34.9855V37.2186C40 37.4784 39.8891 37.7275 39.6917 37.9112C39.4943 38.0949 39.2265 38.1981 38.9474 38.1981H1.05263C0.773457 38.1981 0.505716 38.0949 0.30831 37.9112C0.110903 37.7275 0 37.4784 0 37.2186V34.9855C0 34.2661 0.298439 33.5744 0.834271 33.0558C1.3701 32.5371 2.10107 32.2318 2.87369 32.2039C3.02308 31.9522 3.11954 31.6763 3.1579 31.391V19.7063C3.15175 17.4028 3.71197 15.1285 4.79571 13.0574C5.87945 10.9863 7.45798 9.17331 9.41053 7.75715C11.3907 6.32054 13.698 5.32472 16.1557 4.84597C18.6134 4.36722 21.1563 4.41824 23.5895 4.99513C30.3158 6.52306 35.7895 13.1832 35.7895 19.8336V31.1363C36.1062 31.5791 36.5321 31.9452 37.0316 32.2039C37.8208 32.2091 38.5758 32.5044 39.1319 33.0255C39.688 33.5466 40 34.2512 40 34.9855ZM19.4947 3.54556C20.7262 3.55399 21.9535 3.67869 23.1579 3.91775V2.93831C23.1579 2.15902 22.8252 1.41165 22.233 0.860612C21.6407 0.309571 20.8375 0 20 0C19.1625 0 18.3593 0.309571 17.767 0.860612C17.1748 1.41165 16.8421 2.15902 16.8421 2.93831V3.74145C17.7198 3.6147 18.6065 3.54922 19.4947 3.54556ZM12.7158 39.1775C12.9814 40.798 13.8622 42.2763 15.1985 43.3445C16.5348 44.4127 18.2383 45 20 45C21.7617 45 23.4652 44.4127 24.8015 43.3445C26.1378 42.2763 27.0186 40.798 27.2842 39.1775H12.7158Z" fill="#115691"/>
                </svg>
                <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full px-1">1</span>
            </button>
        </div>
    </div>

    <!-- Lista de notificaciones -->
    <div class="bg-white rounded-b-lg shadow">
        <!-- Notificación 1: Mensaje nuevo -->
        <div class="flex items-center p-4 border-b">
            <div class="flex items-center justify-center w-8 h-8 bg-blue-100 rounded-full">
                <!-- Ícono de mensaje nuevo -->
                <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M37.4998 6.25C39.71 6.25 41.8296 7.12797 43.3924 8.69078C44.9552 10.2536 45.8332 12.3732 45.8332 14.5833V31.25C45.8332 33.4601 44.9552 35.5798 43.3924 37.1426C41.8296 38.7054 39.71 39.5833 37.4998 39.5833H27.6582L17.7373 45.5354C17.4386 45.7147 17.0996 45.8162 16.7514 45.8306C16.4033 45.845 16.0571 45.7719 15.7445 45.6179C15.432 45.4639 15.163 45.2339 14.9623 44.9491C14.7616 44.6643 14.6355 44.3337 14.5957 43.9875L14.5832 43.75V39.5833H12.4998C10.3618 39.5833 8.30561 38.7616 6.75648 37.2881C5.20735 35.8146 4.28382 33.802 4.17692 31.6667L4.1665 31.25V14.5833C4.1665 12.3732 5.04448 10.2536 6.60728 8.69078C8.17008 7.12797 10.2897 6.25 12.4998 6.25H37.4998ZM29.1665 25H16.6665C16.114 25 15.5841 25.2195 15.1934 25.6102C14.8027 26.0009 14.5832 26.5308 14.5832 27.0833C14.5832 27.6359 14.8027 28.1658 15.1934 28.5565C15.5841 28.9472 16.114 29.1667 16.6665 29.1667H29.1665C29.719 29.1667 30.2489 28.9472 30.6396 28.5565C31.0303 28.1658 31.2498 27.6359 31.2498 27.0833C31.2498 26.5308 31.0303 26.0009 30.6396 25.6102C30.2489 25.2195 29.719 25 29.1665 25ZM33.3332 16.6667H16.6665C16.114 16.6667 15.5841 16.8862 15.1934 17.2769C14.8027 17.6676 14.5832 18.1975 14.5832 18.75C14.5832 19.3025 14.8027 19.8324 15.1934 20.2231C15.5841 20.6138 16.114 20.8333 16.6665 20.8333H33.3332C33.8857 20.8333 34.4156 20.6138 34.8063 20.2231C35.197 19.8324 35.4165 19.3025 35.4165 18.75C35.4165 18.1975 35.197 17.6676 34.8063 17.2769C34.4156 16.8862 33.8857 16.6667 33.3332 16.6667Z" fill="#115691"/>
                </svg>
            </div>
            <div class="ml-3">
                <p class="text-sm font-bold">Tienes un nuevo mensaje.</p>
                <p class="text-xs text-gray-500">23/09/2024 21:00</p>
                <span class="ml-auto bg-yellow-200 text-black text-xs px-2 py-1 font-bold rounded-full">No leído</span>
            </div>
        </div>

        <!-- Notificación 2: Ecografía añadida -->
        <div class="flex items-center p-4 border-b">
            <div class="flex items-center justify-center w-8 h-8 bg-red-100 rounded-full">
                <!-- Ícono de ecografía -->
                <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_273_546)">
                        <path d="M4.60938 28.125C8.44375 33.875 14.9344 40.2218 25 46.875C35.0656 40.2218 41.5562 33.875 45.3906 28.125H37.5C37.188 28.1249 36.8831 28.0314 36.6247 27.8565C36.3662 27.6816 36.1661 27.4333 36.05 27.1437L31.4969 15.7625L26.5031 33.2406C26.4138 33.554 26.2288 33.8317 25.9738 34.0348C25.7189 34.2378 25.4068 34.3561 25.0813 34.3729C24.7558 34.3898 24.4332 34.3045 24.1586 34.1289C23.884 33.9533 23.6712 33.6962 23.55 33.3937L18.4031 20.525L13.8 27.4312C13.6571 27.6448 13.4637 27.8199 13.2369 27.9409C13.0102 28.062 12.757 28.1252 12.5 28.125H4.60938Z" fill="#CC0000"/>
                        <path d="M2.74983 25.0004C-7.58454 5.2504 13.7811 -6.2496 24.4467 3.57227C24.6342 3.74519 24.8175 3.92332 24.9967 4.10665C25.1727 3.92216 25.3562 3.74493 25.5467 3.5754C36.2186 -6.2496 57.5811 5.2504 47.2498 25.0004H38.553L32.6967 10.3566C32.5755 10.0541 32.3627 9.79704 32.0881 9.62145C31.8135 9.44586 31.4909 9.36053 31.1654 9.37741C30.8399 9.39429 30.5278 9.51253 30.2729 9.71558C30.0179 9.91862 29.8329 10.1963 29.7436 10.5098L24.753 27.9879L20.1998 16.6066C20.0938 16.3426 19.9177 16.1126 19.6905 15.9413C19.4633 15.77 19.1936 15.6641 18.9106 15.6348C18.6276 15.6055 18.342 15.6541 18.0846 15.7752C17.8271 15.8964 17.6077 16.0855 17.4498 16.3223L11.6623 25.0004H2.74983Z" fill="#CC0000"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_273_546">
                            <rect width="50" height="50" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>
            </div>
            <div class="ml-3">
                <p class="text-sm font-bold">Se ha añadido una ecografía.</p>
                <p class="text-xs text-gray-500">22/09/2024 12:12</p>
                <span class="ml-auto bg-green-200 text-green-800 text-xs px-2 py-1 font-bold rounded-full">Leído</span>
            </div>
        </div>

        <!-- Notificación 3: Crédito por ser embajadora -->
        <div class="flex items-center p-4">
            <div class="flex items-center justify-center w-8 h-8 bg-yellow-100 rounded-full">
                <!-- Ícono de embajadora -->
                <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M25 0C11.2143 0 0 11.2143 0 25C0 38.7857 11.2143 50 25 50C38.7857 50 50 38.7857 50 25C50 11.2143 38.7857 0 25 0ZM32.854 32.6367C32.0989 33.7372 31.1097 34.5629 29.8129 35.1793C28.8563 35.6032 27.8605 35.8636 26.832 35.9605V39.3209C26.832 39.8338 26.4172 40.2473 25.9055 40.2473H23.1327C22.6197 40.2473 22.2062 39.8325 22.2062 39.3209V35.67C21.6841 35.5417 21.1699 35.3625 20.6543 35.1269C19.2685 34.5616 18.151 33.6404 17.3672 32.4012C16.5807 31.251 16.1581 29.9071 16.0926 28.3198C16.0717 27.8173 16.4551 27.3907 16.9563 27.3567L19.4465 27.1866C19.9477 27.1578 20.3716 27.5124 20.4305 28.0018C20.53 28.8354 20.7642 29.525 21.1097 29.9961C21.4983 30.5797 21.9969 30.9631 22.7506 31.2719C24.347 31.9746 26.3779 31.9759 27.7833 31.4355C28.4062 31.1685 28.8472 30.8623 29.139 30.4855C29.3889 30.1269 29.5119 29.7501 29.5119 29.2999C29.5119 28.8773 29.4033 28.5658 29.1403 28.2282C29.0029 28.045 28.6483 27.7022 27.7153 27.3292C27.2599 27.1787 26.0769 26.8425 24.2764 26.4067C22.1735 25.882 20.9566 25.4842 20.2015 25.0746C19.0775 24.4805 18.2334 23.7399 17.7035 22.8775C17.1604 21.9995 16.8856 20.9971 16.8856 19.9006C16.8856 18.7071 17.2193 17.57 17.8762 16.5205C18.5567 15.4973 19.5603 14.6938 20.793 14.1756C21.2052 13.9885 21.6736 13.8315 22.2075 13.7058V10.6163C22.2075 10.1034 22.6223 9.68987 23.134 9.68987H25.9068C26.4198 9.68987 26.8333 10.1047 26.8333 10.6163V13.5423C27.6668 13.681 28.4389 13.8917 29.139 14.1704C30.4933 14.7789 31.4761 15.5941 32.1774 16.6789C32.8801 17.7022 33.2766 18.9309 33.346 20.3088C33.3708 20.8139 32.9861 21.2457 32.481 21.2798L29.932 21.4512C29.4399 21.4852 29.0173 21.1345 28.9505 20.6517C28.8079 19.6061 28.4585 18.8759 27.8814 18.4219C27.2259 17.8631 26.2745 17.6027 24.945 17.6027C23.643 17.6027 22.5975 17.8553 21.9995 18.3159C21.514 18.6901 21.2863 19.1403 21.2863 19.7317C21.2863 20.1871 21.4289 20.5444 21.7103 20.7956C21.8595 20.9134 22.6734 21.4433 25.3049 21.9969C27.4784 22.5098 29.0762 22.977 29.9516 23.3538C31.3465 23.9819 32.3436 24.7919 32.9286 25.7655C33.5815 26.743 33.91 27.837 33.91 29.0722C33.91 30.3572 33.5554 31.5559 32.854 32.6367Z" fill="#EABE3F"/>
                </svg>
            </div>
            <div class="ml-3">
                <p class="text-sm font-bold">Obtuvo S/. 50 de crédito por ser embajadora de la prevención.</p>
                <p class="text-xs text-gray-500">23/09/2024 09:45</p>
                <span class="ml-auto bg-yellow-200 text-black text-xs px-2 py-1 font-bold rounded-full">No leído</span>
            </div>
        </div>
    </div>
</div>