<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="w-[100px] h-full bg-femisalud-900 rounded-full hidden sm:flex flex-col justify-start items-center py-6 gap-3 select-none transition-transform duration-500 ease-in-out" id="sidebar">
    <h1 class="title text-6xl text-white font-bold cursor-pointer" id="logo">F</h1>
    <ul class="w-full text-white font-bold flex flex-col justify-center items-start gap-3">
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/admin/home" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg width="20" height="20" viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"
                         class="fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300">
                        <g clip-path="url(#clip0_273_668)">
                            <path d="M27.5 15.8333C27.3903 15.8339 27.2816 15.8129 27.1801 15.7715C27.0786 15.73 26.9862 15.6689 26.9084 15.5916L15 3.67498L3.09169 15.5916C2.93227 15.7282 2.72721 15.7995 2.51748 15.7914C2.30775 15.7833 2.1088 15.6964 1.96039 15.5479C1.81197 15.3995 1.72503 15.2006 1.71693 14.9909C1.70883 14.7811 1.78017 14.5761 1.91669 14.4166L14.4167 1.91664C14.5728 1.76143 14.784 1.67432 15.0042 1.67432C15.2243 1.67432 15.4356 1.76143 15.5917 1.91664L28.0917 14.4166C28.2064 14.5336 28.284 14.6818 28.3149 14.8427C28.3458 15.0036 28.3287 15.17 28.2655 15.3211C28.2024 15.4723 28.0961 15.6015 27.96 15.6926C27.8238 15.7837 27.6638 15.8326 27.5 15.8333Z"></path>
                            <path d="M15 6.4917L5 16.525V26.6667C5 27.1087 5.17559 27.5327 5.48816 27.8452C5.80072 28.1578 6.22464 28.3334 6.66667 28.3334H12.5V20H17.5V28.3334H23.3333C23.7754 28.3334 24.1993 28.1578 24.5118 27.8452C24.8244 27.5327 25 27.1087 25 26.6667V16.4667L15 6.4917Z"></path>
                        </g>
                        <defs>
                            <clipPath id="clip0_273_668">
                                <rect width="30" height="30" fill="white"></rect>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">Inicio</span>
            </a>
        </li>
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/admin/clinical-notes" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" class="bi bi-journal-bookmark-fill fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M6 1h6v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8z"></path>
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"></path>
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"></path>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">Notas clínicas</span>
            </a>
        </li>
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/admin/register-ultrasound" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg width="20" height="20" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_273_675)">
                            <path d="M2.76562 16.875C5.06625 20.325 8.96063 24.1331 15 28.125C21.0394 24.1331 24.9337 20.325 27.2344 16.875H22.5C22.3128 16.875 22.1299 16.8189 21.9748 16.7139C21.8197 16.609 21.6996 16.4601 21.63 16.2863L18.8981 9.45752L15.9019 19.9444C15.8483 20.1325 15.7373 20.2991 15.5843 20.4209C15.4313 20.5427 15.2441 20.6137 15.0488 20.6238C14.8535 20.6339 14.6599 20.5827 14.4952 20.4774C14.3304 20.372 14.2027 20.2178 14.13 20.0363L11.0419 12.315L8.28 16.4588C8.19425 16.587 8.07821 16.692 7.94215 16.7646C7.80609 16.8372 7.65422 16.8751 7.5 16.875H2.76562Z" class="fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300"></path>
                            <path d="M1.65009 15.0001C-4.55053 3.15008 8.26884 -3.74992 14.6682 2.14321C14.7807 2.24696 14.8907 2.35383 14.9982 2.46383C15.1038 2.35314 15.2139 2.2468 15.3282 2.14508C21.7313 -3.74992 34.5488 3.15008 28.3501 15.0001H23.132L19.6182 6.21383C19.5455 6.0323 19.4178 5.87807 19.253 5.77271C19.0883 5.66736 18.8947 5.61616 18.6994 5.62629C18.5041 5.63641 18.3169 5.70736 18.1639 5.82919C18.011 5.95101 17.8999 6.11763 17.8463 6.30571L14.852 16.7926L12.1201 9.96383C12.0565 9.80542 11.9508 9.66739 11.8145 9.56462C11.6782 9.46186 11.5164 9.39827 11.3466 9.38071C11.1768 9.36315 11.0054 9.39229 10.8509 9.46498C10.6965 9.53768 10.5648 9.65117 10.4701 9.79321L6.99759 15.0001H1.65009Z" class="fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300"></path>
                        </g>
                        <defs>
                            <clipPath id="clip0_273_675">
                                <rect width="30" height="30" fill="white"></rect>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">Ecografías</span>
            </a>
        </li>
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/admin/register-patient" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg width="20" height="20" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M14.9063 1.19538C16.582 1.27741 18.7383 1.68757 20.1094 2.19147L20.4492 2.32038L20.7774 3.11725C21.2344 4.23054 21.75 5.26179 22.1133 5.80085C22.3477 6.14069 22.418 6.31647 22.418 6.4571C22.418 7.07819 21.4688 8.03913 20.3555 8.54304C20.1563 8.63679 20.0156 8.73054 20.0391 8.75397C20.0625 8.77741 20.25 8.91804 20.4492 9.05866C20.6484 9.21101 20.9531 9.44538 21.1289 9.59772C21.5508 9.94929 22.8047 11.168 22.8047 11.2266C22.8047 11.2969 22.2188 11.2735 21.7969 11.1915C21.5742 11.1446 21.1875 11.0274 20.918 10.9454C20.3203 10.7462 20.0859 10.7462 19.1602 10.9337C18.5391 11.0626 18.4102 11.1094 18.1758 11.2852C18.0234 11.4024 17.6953 11.6251 17.4492 11.7774C17.1914 11.9298 16.9688 12.0938 16.9453 12.1407C16.8984 12.2462 17.1914 12.4805 17.3672 12.4805C17.4492 12.4805 17.6719 12.3985 17.8477 12.3048C18.1992 12.129 19.2539 11.6954 19.2774 11.7188C19.3008 11.7423 18.8555 12.0587 18.6094 12.1758C18.4922 12.2344 18.2461 12.3282 18.0586 12.3751C17.6133 12.504 17.0391 12.8204 16.2422 13.3829C15.457 13.9337 15.1641 14.2149 15.1992 14.4258C15.2227 14.6719 15.3984 14.6368 15.9844 14.2969C16.2774 14.1212 16.7227 13.8868 16.9688 13.7696C17.4141 13.5469 18.3164 13.2071 18.3633 13.254C18.3867 13.2891 17.3672 13.7813 17.2852 13.7813C17.1211 13.7813 15.4688 14.7188 15.2109 14.9532C15.0586 15.0938 15.0586 15.2696 15.1875 15.3985C15.2813 15.4805 15.3164 15.4805 15.5156 15.4102C15.6445 15.3633 15.9258 15.2344 16.1484 15.1055C16.5938 14.8594 17.4375 14.5313 18.2227 14.3087C18.5039 14.2266 18.7852 14.1446 18.8203 14.1329C18.8789 14.1094 18.8906 14.1212 18.8438 14.168C18.8086 14.2032 18.5859 14.3087 18.3633 14.3907C18.1289 14.4727 17.5078 14.7891 16.9922 15.0704C16.2188 15.504 16.0313 15.6212 15.9961 15.7383C15.9727 15.8204 15.9844 15.9141 16.0078 15.9727C16.1133 16.1485 16.3359 16.1016 17.0508 15.7852C17.918 15.3985 19.3711 14.8126 19.4063 14.8477C19.4531 14.8946 18.5274 15.3985 18.1172 15.5391C17.6836 15.6915 17.4024 15.8907 17.4024 16.043C17.4024 16.1602 17.6719 16.3712 17.8359 16.3712C17.9297 16.3712 18.4336 16.2188 18.9727 16.043C19.5 15.8673 20.2969 15.6212 20.7188 15.5274C21.6563 15.3048 22.0899 15.0938 22.9805 14.4141C23.9297 13.711 23.9063 13.7227 24.4805 13.8985C24.8203 14.004 24.8555 14.0274 24.9844 14.2852C26.2617 16.8048 26.0274 19.8751 24.3399 22.5821C23.9297 23.2501 23.3906 23.9298 22.5352 24.8907C22.1016 25.3712 21.6445 25.9102 21.5156 26.0977C21.1875 26.543 21.0352 27.0587 21.0352 27.6915C21.0352 28.1954 21.0938 28.3946 21.3164 28.6993L21.3984 28.8165H13.8281H6.25782L5.82423 28.1368C5.05079 26.9649 4.68751 26.1798 4.41798 25.1251C4.20704 24.3048 4.16017 23.0977 4.33595 22.2891C4.48829 21.5391 4.91017 20.4258 5.43751 19.4063C5.82423 18.6329 6.55079 17.379 6.63282 17.3321C6.64454 17.3204 7.11329 17.7305 7.65236 18.2462C8.71876 19.2657 9.31642 19.7696 9.87892 20.168C10.0781 20.3087 10.5352 20.6954 10.875 21.0235C11.4961 21.6212 11.5078 21.6212 12.6445 22.2071C13.2656 22.5235 14.1797 23.004 14.6484 23.2735C15.668 23.8477 16.2891 24.0704 17.5078 24.3165C18.5039 24.5157 19.3945 24.5626 20.7305 24.4923C21.7266 24.4454 21.9024 24.3985 21.832 24.2227C21.7852 24.0938 21.7031 24.0469 21.4922 24.0469C21.1875 24.0469 21.457 23.9532 21.8086 23.9532C22.3477 23.9415 22.5 23.7891 22.2422 23.543C22.1367 23.4376 22.043 23.4024 21.6328 23.379C20.7656 23.3087 20.7539 23.2501 21.6211 23.2501C22.4649 23.2501 22.5469 23.2266 22.5469 22.9923C22.5469 22.8165 22.2656 22.5118 22.0195 22.4298C21.9024 22.3946 21.4219 22.3477 20.9649 22.3126C20.2969 22.2774 19.9688 22.2305 19.4531 22.0899C17.9766 21.7032 17.1914 21.3633 17.1328 21.0821C17.1094 20.9532 17.332 20.9649 18.3047 21.0938C19.6406 21.293 19.6758 21.293 19.7813 21.1407C19.8984 20.9766 19.8867 20.8008 19.7695 20.6837C19.7109 20.6251 19.2891 20.4376 18.8203 20.2618C18.3516 20.086 17.6836 19.8048 17.3203 19.6407C16.9688 19.4766 16.5234 19.3126 16.3359 19.2774C15.9961 19.2188 15.9727 19.2188 14.9531 19.4063C14.0039 19.5821 13.207 19.2423 12.0352 18.1524C10.9922 17.1798 9.24611 14.8594 8.1797 13.0196C8.01564 12.7383 7.72267 12.2462 7.54689 11.918C6.48048 10.0899 5.76564 7.80475 5.48439 5.34382L5.40236 4.66413L5.63673 4.40632C6.23439 3.72663 7.30079 2.95319 8.3672 2.42585C10.2422 1.46491 12.3164 1.07819 14.9063 1.19538Z" class="fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300"></path>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">Pacientes</span>
            </a>
        </li>
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/admin/register-call-center" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-headset fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300" viewBox="0 0 16 16">
                        <path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5"></path>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">Call center</span>
            </a>
        </li>
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/admin/profile" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-gear-fill fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300" viewBox="0 0 16 16">
                        <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"></path>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">perfil</span>
            </a>
        </li>
        <li class="container-button w-full flex justify-center items-center">
            <a href="${pageContext.request.contextPath}/logout" class="flex justify-center items-center gap-6 group">
                <div class="aspect-square p-5 rounded-full bg-femisalud-300 group-hover:bg-femisalud-900 flex items-center justify-center border-2 border-femisalud-600 group-hover:border-femisalud-300">
                    <svg width="20" height="20" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M29.8799 14.4375C29.7197 14.2969 29.7197 14.1562 29.5595 14.0156L24.7545 9.79688C24.1139 9.23438 23.1529 9.23438 22.5122 9.79688C21.8715 10.3594 21.8715 11.2031 22.5122 11.7656L24.5944 13.5937H17.2267C16.2657 13.5937 15.625 14.1562 15.625 15C15.625 15.8437 16.2657 16.4062 17.2267 16.4062H24.5944L22.5122 18.2344C21.8715 18.7969 21.8715 19.6406 22.5122 20.2031C22.8325 20.4844 23.313 20.625 23.6334 20.625C23.9537 20.625 24.4342 20.4844 24.7545 20.2031L29.5595 15.9844C29.7197 15.8437 29.8799 15.7031 29.8799 15.5625C30.04 15.1406 30.04 14.8594 29.8799 14.4375Z"  class="fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300"></path>
                        <path d="M20.5871 25.1667C18.7754 26.1667 16.7991 26.6667 14.8227 26.6667C8.39954 26.6667 3.29394 21.5 3.29394 15C3.29394 8.5 8.39954 3.33333 14.8227 3.33333C16.7991 3.33333 18.7754 3.83333 20.5871 4.83333C21.4106 5.33333 22.3988 5 22.8929 4.16667C23.3869 3.33333 23.0576 2.33333 22.2341 1.83333C19.9283 0.666667 17.4579 0 14.8227 0C6.58787 0 0 6.66667 0 15C0 23.3333 6.58787 30 14.8227 30C17.4579 30 19.9283 29.3333 22.2341 28C23.0576 27.5 23.2222 26.5 22.8929 25.6667C22.3988 25 21.4106 24.6667 20.5871 25.1667Z"  class="fill-[#115691] group-hover:fill-[#ddedfc] transition-colors duration-300"></path>
                    </svg>
                </div>
                <span class="label-button hidden text-inter text-2xl">Cerrar sesión</span>
            </a>
        </li>
    </ul>
</nav>
