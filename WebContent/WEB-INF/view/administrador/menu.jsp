 <!-- Importando a biblioteca Taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 <!-- HEADER DESKTOP-->
        <header class="header-desktop3 d-none d-lg-block">
            <div class="section__content section__content--p35">
                <div class="header3-wrap">
                    <div class="header__logo">
                        <a href="paginaInicial">
                            <img src="<%=request.getContextPath()%>/resources/img/icon/logo2.png" alt="WorkFast" width="250" height="50" />
                        </a>
                    </div>
                    <div class="header__navbar">
                        <ul class="list-unstyled">
                            <li>
                                <a href="paginaInicial">
                                    <i class="fas fa-home"></i>
                                    <span class="bot-line"></span>Pagina Inical</a>
                            </li>
                            <li class="has-sub">
                                <a href="#">
                                  
                                    <i class="fas fa-group"></i>Gerenciar
                                    <span class="bot-line"></span>
                                </a>
                                <ul class="header3-sub-list list-unstyled">
                                
                                    <c:if test="${usuarioLogado.nivel_acesso != '2'}">
	                                     <li>
	                                        <a href="gerenciarAdm">Adminstradores</a>
	                                     </li>
                                    </c:if>
                                   
                                    <li>
                                        <a href="gerenciarPrestador">Prestadores de Serviços</a>
                                    </li>
                                    <li>
                                        <a href="gerenciarCliente">Clientes</a>
                                    </li>
                                   
                                </ul>
                            </li>
                            <li>
                                <a href="telaProfissao">
                                    <i class="fas fa-wrench"></i>
                                    <span class="bot-line"></span>Especializações</a>
                            </li>
                            
                              <li class="has-sub">
                                <a href="#">
                                  
                                    <i class="fas  fa-map-marker"></i>Localidade
                                    <span class="bot-line"></span>
                                </a>
                                <ul class="header3-sub-list list-unstyled">
                                
                                                          
                                    <li>
                                        <a href="telaEstado">Estado</a>
                                    </li>
                                    <li>
                                        <a href="telaCidade">Cidade</a>
                                    </li>
                                   
                                </ul>
                            </li>
                            
                            <li class="has-sub">
                                <a href="#">
                                  
                                    <i class="fas  fa-map-marker"></i>Servicos
                                    <span class="bot-line"></span>
                                </a>
                                <ul class="header3-sub-list list-unstyled">
                                
                                                          
                                    <li>
                                        <a href="telaCategoriaServico">Categoria</a>
                                    </li>
                                    <li>
                                        <a href="telaServico">Subcategoria</a>
                                    </li>
                                   
                                </ul>
                            </li>
                           
                           
                          
                        </ul>
                    </div>
                    <div class="header__tool">
                        <div class="header-button-item has-noti js-item-menu">
                            <i class="zmdi zmdi-notifications"></i>
                            <div class="notifi-dropdown notifi-dropdown--no-bor js-dropdown">
                                <div class="notifi__title">
                                    <p>Você tem 3 notificações</p>
                                </div>
                                <div class="notifi__item">
                                    <div class="bg-c1 img-cir img-40">
                                        <i class="zmdi zmdi-email-open"></i>
                                    </div>
                                    <div class="content">
                                        <p>Você recebeu uma notificação por email</p>
                                        <span class="date">abril 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__item">
                                    <div class="bg-c2 img-cir img-40">
                                        <i class="zmdi zmdi-account-box"></i>
                                    </div>
                                    <div class="content">
                                        <p>Sua conta foi bloqueada</p>
                                        <span class="date">Abril 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__item">
                                    <div class="bg-c3 img-cir img-40">
                                        <i class="zmdi zmdi-file-text"></i>
                                    </div>
                                    <div class="content">
                                        <p>Você tem um novo arquivo</p>
                                        <span class="date">Abril 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__footer">
                                    <a href="#">Todas as notificações</a>
                                </div>
                            </div>
                        </div>

                         <div class="header-button-item ">
                            
                            
                        </div>
                        
                        <div class="account-wrap">
                            <div class="account-item account-item--style2 clearfix js-item-menu">
                                <div class="image">
                                    <img src="<%=request.getContextPath()%>/resources/img/icon/avatar-01.jpg" alt="${usuarioLogado.nome} " />
                                </div>
                                <div class="content">
                                    <a class="js-acc-btn" href="#">${usuarioLogado.nome}</a>
                                </div>
                                <div class="account-dropdown js-dropdown">
                                    <div class="info clearfix">
                                        <div class="image">
                                            <a href="#">
                                                <img src="<%=request.getContextPath()%>/resources/img/icon/avatar-01.jpg" alt="${usuarioLogado.nome}" />
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
                                            <a href="#">
                                                <i class="zmdi zmdi-account"></i>Minha Conta</a>
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
        </header>
        <!-- END HEADER DESKTOP-->

        <!-- HEADER MOBILE-->
        <header class="header-mobile header-mobile-2 d-block d-lg-none" style="background-color: #fff">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner" >
                        <a class="logo" href="paginaInicial">
                            <img src="<%=request.getContextPath()%>/resources/img/icon/logo2.png" alt="workfast" width="250" height="50"/>
                        </a>
                        <button class="hamburger hamburger--slider" type="button" style="background-color: #191970;">
                            <span class="hamburger-box"  >
                                <span class="hamburger-inner" ></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                            <li>
                                <a href="paginaInicial">
                                    <i class="fas fa-home"></i>
                                    <span class="bot-line"></span>Pagina Inical</a>
                            </li>
                            <li class="has-sub">
                                <a href="#">
                                    <i class="fas fa-group"></i>Gerenciar
                                    <span class="bot-line"></span>
                                </a>
                                <ul class="header3-sub-list list-unstyled">
                                    <li>
                                        <a href="gerenciarAdm">Adminstradores</a>
                                    </li>
                                    <li>
                                        <a href="gerenciarPrestador">Prestadores de Serviços</a>
                                    </li>
                                    <li>
                                        <a href="gerenciarCliente">Clientes</a>
                                    </li>
                                   
                                </ul>
                            </li>
                            <li>
                                <a href="telaProfissao">
                                    <i class="fas fa-wrench"></i>
                                    <span class="bot-line"></span>Especializações</a>
                            </li>
                             <li class="has-sub">
                                <a href="#">
                                  
                                    <i class="fas  fa-map-marker"></i>Localidade
                                    <span class="bot-line"></span>
                                </a>
                                <ul class="header3-sub-list list-unstyled">
                                
                                                          
                                    <li>
                                        <a href="telaEstado">Estado</a>
                                    </li>
                                    <li>
                                        <a href="telaCidade">Cidade</a>
                                    </li>
                                   
                                </ul>
                            </li>
                            
                            <li class="has-sub">
                                <a href="#">
                                  
                                    <i class="fas  fa-map-marker"></i>Servicos
                                    <span class="bot-line"></span>
                                </a>
                                <ul class="header3-sub-list list-unstyled">
                                
                                                          
                                    <li>
                                        <a href="telaCategoriaServico">Categoria</a>
                                    </li>
                                    <li>
                                        <a href="telaServico">subcategoria</a>
                                    </li>
                                   
                                </ul>
                            </li>
                           
                      
                    </ul>
                </div>
            </nav>
        </header>
        <div class="sub-header-mobile-2 d-block d-lg-none">
            <div class="header__tool">
                <div class="header-button-item has-noti js-item-menu">
                    <i class="zmdi zmdi-notifications"></i>
                         <div class="notifi-dropdown notifi-dropdown--no-bor js-dropdown">
                                <div class="notifi__title">
                                    <p>Você tem 3 notificações</p>
                                </div>
                                <div class="notifi__item">
                                    <div class="bg-c1 img-cir img-40">
                                        <i class="zmdi zmdi-email-open"></i>
                                    </div>
                                    <div class="content">
                                        <p>Você recebeu uma notificação por email</p>
                                        <span class="date">abril 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__item">
                                    <div class="bg-c2 img-cir img-40">
                                        <i class="zmdi zmdi-account-box"></i>
                                    </div>
                                    <div class="content">
                                        <p>Sua conta foi bloqueada</p>
                                        <span class="date">Abril 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__item">
                                    <div class="bg-c3 img-cir img-40">
                                        <i class="zmdi zmdi-file-text"></i>
                                    </div>
                                    <div class="content">
                                        <p>Você tem um novo arquivo</p>
                                        <span class="date">Abril 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__footer">
                                    <a href="#">Todas as notificações</a>
                                </div>
                            </div>
                </div>

               
                <div class="account-wrap">
                    <div class="account-item account-item--style2 clearfix js-item-menu">
                        <div class="image">
                            <img src="<%=request.getContextPath()%>/resources/img/icon/avatar-01.jpg" alt="${usuarioLogado.nome}" />
                        </div>
                        <div class="content">
                            <a class="js-acc-btn" href="#">${usuarioLogado.nome}</a>
                        </div>
                        <div class="account-dropdown js-dropdown">
                            <div class="info clearfix">
                                <div class="image">
                                    <a href="#">
                                        <img src="<%=request.getContextPath()%>/resources/img/icon/avatar-01.jpg" alt="${usuarioLogado.nome}" />
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
                                    <a href="#">
                                        <i class="zmdi zmdi-account"></i>Minha Conta</a>
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
        <!-- END HEADER MOBILE -->
