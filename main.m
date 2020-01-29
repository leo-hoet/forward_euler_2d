##Definicion de parametros
rho = 2698.4;     ##Densidad del aluminio en kg/m^3
c = 920.887;      ##Calor especifico del aluminio en Joule/(kg*K)
k = 164;          ##Coeficiente k en watt/(metro*kelvin)
L = 0.040;        ##Largo el metros
H = 0.05;         ##Alto en metros
T_0 = 70;         ##Temperatura inicial en grados centigrados
T_a = 30;         ##Temperatura del aire en grados centigrados
h_c = 200;        ## W/(m^2 * K)
delta_x = 0.002;  ##Paso espacial en metros



delta_t = determinar_tiempo(delta_x,k,rho,c,L,H);
[M,n,m] = cargar_matriz_forward(delta_x,delta_t,k,rho,c,L,H);
U = forward_euler(M,delta_t,delta_x,H,n,h_c,k,T_a);
A = getMatrix(U,n,m);
save_images(A);
