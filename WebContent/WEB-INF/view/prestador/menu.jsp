 <!-- Importando a biblioteca Taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


 
 <aside class="menu-sidebar2">
            <div class="logo">
                <a href="#">
                   <h1 style="color: white;"><b>WORKFAST</b></h1>
                </a>
            </div>
            <div class="menu-sidebar2__content js-scrollbar1">
                <div class="account2">
                    <div class="image img-cir img-120">
                        <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.foto}" alt="${usuarioLogado.nome}" />
                    </div>
                    <h4 class="name">${usuarioLogado.nome}</h4>
                    <a href="logout"><i class="fas fa-sign-out-alt"></i> Sair</a>
                </div>
                <nav class="navbar-sidebar2">
                    <ul class="list-unstyled navbar__list">
                      
                        <li>
                            <a href="paginaInicialPrestador">
                                <i class="fas  fa-home"></i>Pagina Inicial</a>
                           
                        </li>
                        <li>
                          <a href="paginaEspecializacao">
                               <i class="fas fa-wrench"></i>Especializações</a>
                        </li>
                        <li>
                            <a href="ExibirServicos">
                                <i class="fas fa-gears"></i>Meus Serviços</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas  fa-list-alt"></i>Solicitações de Serviços
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                
                                <li>
                                    <a href="ServicosEmAberto?cas=${usuarioLogado.idUsuario}">
                                        <i class="fas fa-thumbtack "></i>Em aberto</a>
                                </li>
                                <li>
                                    <a href="ServicosEmAndamento?cas=${usuarioLogado.idUsuario}">
                                        <i class="fa fa-clock"></i>Em andamento</a>
                                </li>
                               
                                <li>
                                    <a href="ServicosFinalizados?cas=${usuarioLogado.idUsuario}">
                                        <i class="fas fa-legal"></i>Terminados</a>
                                </li>
                                <li>
                                    <a href="ServicosCancelados?cas=${usuarioLogado.idUsuario}">
                                        <i class="fa fa-ban "></i>Pedidos Cancelados</a>
                                </li>
                               
                            </ul>
                        </li>
                        
                         <li>
                            <a href="ajudaPrestador">
                                <i class="fa fa-question"></i>Ajuda</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container2">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop2">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap2">
                            <div class="logo d-block d-lg-none">
                                <a href="#">
                                   <h1 style="color: white;"><b>WORKFAST</b></h1>
                                </a>
                            </div>
                            <div class="header-button2">
                                
                                <div class="header-button-item has-noti js-item-menu">
                                    <i class="zmdi zmdi-notifications"></i>
                                    <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__title">
                                            <p>Voce tem 3 notificações</p>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 img-cir img-40">
                                                <i class="zmdi zmdi-email-open"></i>
                                            </div>
                                            <div class="content">
                                                <p>Voce recebeu uma notificação pelo email</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c2 img-cir img-40">
                                                <i class="zmdi zmdi-account-box"></i>
                                            </div>
                                            <div class="content">
                                                <p>Sua conta foi bloqueada</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c3 img-cir img-40">
                                                <i class="zmdi zmdi-file-text"></i>
                                            </div>
                                            <div class="content">
                                                <p>Novo arquivo</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__footer">
                                            <a href="#">Todas Notificações</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="header-button-item mr-0 js-sidebar-btn">
                                    <i class="zmdi zmdi-menu"></i>
                                </div>
                                <div class="setting-menu js-right-sidebar d-none d-lg-block">
                                    <div class="account-dropdown__body">
                                        <div class="account-dropdown__item">
                                            <a href="minhaConta">
                                                <i class="zmdi zmdi-account"></i>Minha Conta</a>
                                                
                                        </div>
                                         <div class="account-dropdown__item">
                                            <a href="logout">
                                                <i class="fas fa-sign-out-alt"></i>Sair</a>                     
                                        </div>
                                        
                                    </div>
                                </div>
                                
                             
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <aside class="menu-sidebar2 js-right-sidebar d-block d-lg-none">
                <div class="logo">
                    <a href="#">
                         <h1 style="color: white;"><b>WORKFAST</b></h1>
                    </a>
                </div>
                <div class="menu-sidebar2__content js-scrollbar2">
                    <div class="account2">
                        <div class="image img-cir img-120">
                            <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.foto}" alt="${usuarioLogado.nome}" />
                        </div>
                        <h4 class="name">${usuarioLogado.nome}</h4>
                        <a href="logout">Sair</a>
                    </div>
                    <nav class="navbar-sidebar2">
                       <ul class="list-unstyled navbar__list">
                       <li>
                            <a href="paginaInicialPrestador">
                                <i class="fas  fa-home"></i>Pagina Inicial</a>
                           
                        </li>
                        <li>
                          <a href="paginaEspecializacao">
                               <i class="fas fa-wrench"></i>Especializações</a>
                        </li>
                        <li>
                            <a href="ExibirServicos">
                                <i class="fas fa-gears"></i>Meus Serviços</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas  fa-list-alt"></i>Solicitações
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="ServicosEmAberto?cas=${usuarioLogado.idUsuario}">
                                        <i class="fas fa-thumbtack "></i>Em aberto</a>
                                </li>
                                <li>
                                    <a href="ServicosEmAndamento?cas=${usuarioLogado.idUsuario}">
                                        <i class="fa fa-clock"></i>Em andamento</a>
                                </li>
                               
                                <li>
                                    <a href="ServicosFinalizados?cas=${usuarioLogado.idUsuario}">
                                        <i class="fas fa-legal"></i>Terminados</a>
                                </li>
                                <li>
                                    <a href="ServicosCancelados?cas=${usuarioLogado.idUsuario}">
                                        <i class="fa fa-ban "></i>Pedidos Cancelados</a>
                                </li>
                               
                            </ul>
                        </li>
                        <li>
                           <a href="minhaConta">
                                  <i class="zmdi zmdi-account"></i>Minha Conta</a>
                        </li>
                       
                        <li>
                            <a href="ajudaPrestador">
                                <i class="fa fa-question"></i>Ajuda</a>
                        </li>
                        
                    </ul>
                    </nav>
                </div>
            </aside>