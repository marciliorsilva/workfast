 <!-- Importando a biblioteca Taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="page-wrapper">
        <!-- Menu horizontal-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="paginaInicialCliente">
                            <img style="width: 120px; height: 35px;"  src="<%=request.getContextPath()%>/resources/img/icon_cliente/logo3.png" alt="WorkFast" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li>
                            <a href="paginaInicialCliente">
                                <i class="fa fa-home"></i>Home</a>
                        </li>
                    
                        
                                <li>
                                    <a href="servicoSolicitadosPendentes?cas=${usuarioLogado.idUsuario}"><i class="fa fa-exclamation" aria-hidden="true"></i>Pedidos Pendentes</a>
                                </li>
                                <li>
                                    <a style="font-size: 15px;" href="servicoSolicitadosAndamento?cas=${usuarioLogado.idUsuario}"><i class="fa fa-clock" aria-hidden="true"></i>Pedidos em Andamento</a>
                                </li>
                                <li>
                                    <a href="servicoSolicitadosCancelado?cas=${usuarioLogado.idUsuario}"><i class="fa fa-times" aria-hidden="true"></i>Pedidos Cancelados</a>
                                </li>
                                <li>
                                    <a href="servicoSolicitadosFinalizado?cas=${usuarioLogado.idUsuario}"><i class="fa fa-check" aria-hidden="true"></i>Pedidos Finalizados</a>
                                </li>
                         


                        <li>
                            <a href="ajudaCliente">
                                <i class="fa fa-question" aria-hidden="true"></i>Ajuda</a>
                        </li>
                         <li>
                                <a href="logout">
                                <i class="far fa-sign-out-alt"></i>Sair</a>
                          </li>
                        
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Fim menu horizontal-->

        <!-- Menu lateral -->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="paginaInicialCliente">
                    <img style="width: 220px; height: 35px;" src="<%=request.getContextPath()%>/resources/img/icon_cliente/logo3.png" alt="WorkFast" />
                </a>
                
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                       
                        <li >
                            <a href="paginaInicialCliente">
                                <i class=" fa fa-home"></i>Home</a>
                        </li>
                       
                                <li>
                                    <a href="servicoSolicitadosPendentes?cas=${usuarioLogado.idUsuario}">&nbsp;<i class="fa fa-exclamation" aria-hidden="true"></i>Pedidos Pendentes</a>
                                </li>
                                <li>
                                    <a style="font-size: 15px;" href="servicoSolicitadosAndamento?cas=${usuarioLogado.idUsuario}"><i class="fa fa-clock" aria-hidden="true"></i>Pedidos em Andamento</a>
                                </li>
                                <li>
                                    <a href="servicoSolicitadosCancelado?cas=${usuarioLogado.idUsuario}"><i class="fa fa-times" aria-hidden="true"></i>Pedidos Cancelados</a>
                                </li>
                                <li>
                                    <a href="servicoSolicitadosFinalizado?cas=${usuarioLogado.idUsuario}"><i class="fa fa-check" aria-hidden="true"></i>Pedidos Finalizados</a>
                                </li>
                          

                        <li class="">
                            <a href="ajudaCliente">
                                <i class="fa fa-question" aria-hidden="true"></i>Ajuda</a>
                        </li>
                        <hr>
                        <li>
                                <a href="logout">
                                <i class="zmdi zmdi-power"></i>Sair</a>
                          </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- Fim do menu Lateral-->

      
        <div class="page-container" >
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">

                        	<!-- Div que substitui o formulário -->
                            <div class="form-header"></div>

                            <!-- Icone de notificação -->	
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-notifications"></i>
                                        <span class="quantity">1</span>
                                        <div class="notifi-dropdown js-dropdown">
                                            <div class="notifi__title">
                                                <p>Você tem 1 notificação</p>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <div class="content">
                                                    <p><strong>Gabriel</strong> disse que finalizou o seu serviço</p>
                                                    <span class="date">Julho 16, 2018 10:30</span>
                                                </div>
                                            </div>
                                            
                                            <div class="notifi__footer">
                                                <a href="#">Veja todas notificações</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                    
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.foto}"  />
                                        </div>
                                        
                                        
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">${usuarioLogado.nome}</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">

                                                <div class="image">
                                                    <a href="#">
                                                        <img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.foto}"  />    
                                                    </a>
                                                </div>

                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#">${usuarioLogado.nome}</a>
                                                    </h5>
                                                    <span class="email">${usuarioLogado.email}</span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="minhaContaCliente">
                                                        <i class="zmdi zmdi-account"></i>Minha conta</a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="meuEnderecos">
                                                        <i class="fa fa-map-marker"></i>Meus endereços</a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="logout">
                                                    <i class="zmdi zmdi-power"></i>Sair</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Fim das funcionalidades  do menu horizontal -->
