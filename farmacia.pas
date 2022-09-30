program Farmacia;
uses CRT;
var
 sec: text;
 secsal: file of Char;
 v: Char;
 cantidad: integer;
 precio: integer;
 cantidad_enero: longint; cantidad_febrero: longint; cantidad_marzo: longint; cantidad_abril: longint; cantidad_mayo: longint; cantidad_junio: longint; cantidad_julio:longint; cantidad_agosto: longint; cantidad_septiembre: longint; cantidad_octubre: longint; cantidad_noviembre: longint; cantidad_diciembre: longint;
 precio_enero: longint; precio_febrero: longint; precio_marzo: longint; precio_abril: longint; precio_mayo: longint; precio_junio: longint; precio_julio: longint; precio_agosto: longint; precio_septiembre: longint; precio_octubre: longint; precio_noviembre: longint; precio_diciembre: longint;
 m1: char; m2: char; a1: char; a2: char; a3: char; a4: char;

 procedure Cant (var v: char);
 var
 total: integer;
 numero: integer;
 begin
 write(': ');
    total:=0;
    while v <> '#' do
     begin
         case v of 
             '0':numero:=0;
             '1':numero:=1;
             '2':numero:=2;
             '3':numero:=3;
             '4':numero:=4;
             '5':numero:=5;
             '6':numero:=6;
             '7':numero:=7;
             '8':numero:=8;
             '9':numero:=9;
         end;

     total:= total*10 + numero;
     Write(v);
     Read (sec, v);
     end;
    cantidad:= total;

 writeln(' unidades');
 delay(245);

 if a1='2' then
 begin
     if a2='0' then
     begin
         if a3='1' then
         begin
             if a4='9' then
             begin
                 If m1 = '0' then
                     begin
                        case m2 of
                             '1':cantidad_enero:=cantidad_enero + cantidad;
                             '2':cantidad_febrero:=cantidad_febrero + cantidad;
                             '3':cantidad_marzo:=cantidad_marzo + cantidad;
                             '4':cantidad_abril:= cantidad_abril + total;
                             '5':cantidad_mayo:= cantidad_mayo + total;
                             '6':cantidad_junio:= cantidad_junio + total;
                             '7':cantidad_julio:= cantidad_julio + total;
                             '8':cantidad_agosto:= cantidad_agosto + total;
                             '9':cantidad_septiembre:= cantidad_septiembre + total;
                        end;
                     end

                else
                If m1 = '1' then
                    begin
                         case m2 of
                                 '0':cantidad_octubre:= cantidad_octubre + total;
                                 '1':cantidad_noviembre:= cantidad_noviembre + total;
                                 '2':cantidad_diciembre:= cantidad_diciembre + total;
                         end;
                    end;
                end;
            end;
         end;
    end;
 end;

procedure Prec(var v: char);
 var
 total, numero: integer;
 begin 
 total:=0;
     while v <> '+' do
     begin
        case v of 
             '0':numero:=0;
             '1':numero:=1;
             '2':numero:=2;
             '3':numero:=3;
             '4':numero:=4;
             '5':numero:=5;
             '6':numero:=6;
             '7':numero:=7;
             '8':numero:=8;
             '9':numero:=9;
        end;

     total:= total*10 + numero;
     Read (sec, v);
     end;
     precio:= total;

 if a1 ='2' then
 begin
     if a2 ='0' then
     begin
         if a3='1' then
         begin
             if a4='9' then
             begin
                 If m1 = '0' then
                 begin
                     case m2 of
                         '1':precio_enero:=precio_enero + (precio * cantidad);
                         '2':precio_febrero:=precio_febrero + (precio * cantidad);
                         '3':precio_marzo:=precio_marzo + (precio * cantidad);
                         '4':precio_abril:= precio_abril + (precio * cantidad);
                         '5':precio_mayo:= precio_mayo + (precio * cantidad);
                         '6':precio_junio:= precio_junio + (precio * cantidad);
                         '7':precio_julio:= precio_julio + (precio * cantidad);
                         '8':precio_agosto:= precio_agosto + (precio * cantidad);
                         '9':precio_septiembre:= precio_septiembre + (precio * cantidad);
                     end;
                 end
            else
             If m1 = '1' then
                 begin
                     case m2 of
                         '0':precio_octubre:= precio_octubre + (precio * cantidad);
                         '1':precio_noviembre:= precio_noviembre + (precio * cantidad);
                         '2':precio_diciembre:= precio_diciembre + (precio * cantidad);
                    end;
                end;
            end;
        end;
    end;
end;
end;



BEGIN
ClrScr;
assign(sec, 'sec.txt');
{$I-}
reset(sec);
{$I+}
if IOResult <> 0 then
halt(2);
read(sec, v);
assign(secsal,'secsal.txt');
rewrite(secsal);
writeln('Se muestra por pantalla el nombre de las sustancias almacenadas seguido de la cantidad de las mismas.');
delay(1500);

 while not EOF(sec) do
 begin

 cantidad:=0;
 precio:=0;

     //estoy en el primer digito

     if v = 'L' then
     begin
         //si es venta libre
         read(sec, v);

         //estoy en el primer digito del dia
         write(secsal, v);
         read(sec, v);  

         //estoy en el segundo digito del dia
         write (secsal, v);
         read(sec, v); 

         //copié en la secuencia de salida


         //estoy en el primer digito del mes

         m1:=v;
         write (secsal, '/');
         //copio una '/' para darle el formato de fecha
         write (secsal, v);
         read(sec, v);

         //segundo digito del mes
         m2:=v;
         write (secsal, v);
         read(sec, v);

         //estoy en el primer digito del año

         a1:=v;
         write (secsal, '/');
         //copio una '/' para darle el formato de fecha
         write (secsal, v);
         read(sec, v);

         a2:=v;
         write (secsal, v);
         read(sec, v);

         a3:=v;
         write (secsal, v);
         read(sec, v);

         a4:=v;
         write (secsal, v);
         read(sec, v);

         //avancé y copié la fecha de registro en la secuencia de salida
         write (secsal, '#');


         while v <> '#' do
         begin
             write(secsal, v);
             write(v);
             read(sec, v);
         end;
         write(secsal, '+');
         //copio un '+' para seguir el formato del registro original

         //copié fecha de registro y nombre de los medicamentos de venta libre y los mostré por pantalla. estoy en un '#'
         read(sec, v);

         while v <> '#' do
         begin
             read(sec, v);
         end;

         //avancé el código
         read(sec, v);

         //estoy en la cantidad de medicamentos
         cant(v);

         //mostré cantidad por pantalla, convertí a entero la cantidad
         read(sec, v);
         prec(v);

     end
         //convertí a entero el precio
     
     else if v = 'R' then
     begin
         //si es venta con receta
         read(sec, v);
         //estoy en el primer digito del dia
         read(sec, v);
         //estoy en el segundo digito del dia
         read(sec, v);  

         //estoy en el primer digito del mes

         m1:=v;
         read(sec, v);
         //segundo digito del mes
         m2:=v;
         read(sec, v);
         //estoy en el primer digito del año

         a1:=v;
         read(sec, v);

         a2:=v;
         read(sec, v);

         a3:=v;
         read(sec, v);

         a4:=v;
         read(sec, v);


         while v <> '#' do
         begin
             write (v);
             read(sec, v);
         end;

         //mostré por pantalla nombre del medicamento. estoy en un '#'


         read(sec, v);

         while v <> '#' do
         begin
             read(sec, v);
         end;

         //avancé el código
         read(sec, v);
         //estoy en la cantidad de medicamentos
         cant(v);
         //mostré cantidad por pantalla, convertí a entero la cantidad
         read(sec, v);
         prec(v);
         //convertí a entero el precio
         
     end;

     
     read(sec, v);
     //estoy en el primer digito de un medicamento nuevo

 end;

writeln(' ');
delay(2000);
writeln('A continuacion se emite un informe mensual de las cantidades de medicamentos ingresados y su precio total, del 2019:');
delay(1500);
writeln('Para el mes de Enero, ingresaron: ', cantidad_enero,' medicamentos, cuyo precio total en dolares es de: USD ', precio_enero);
delay(245);
writeln('Para el mes de Febrero, ingresaron: ', cantidad_febrero,' medicamentos, cuyo precio total en dolares es de: USD ', precio_febrero);
delay(245);
writeln('Para el mes de Marzo, ingresaron: ', cantidad_marzo,' medicamentos, cuyo precio total en dolares es de: USD ', precio_marzo);
delay(245);
writeln('Para el mes de Abril, ingresaron: ', cantidad_abril,' medicamentos, cuyo precio total en dolares es de: USD ', precio_abril);
delay(245);
writeln('Para el mes de Mayo, ingresaron: ', cantidad_mayo,' medicamentos, cuyo precio total en dolares es de: USD ', precio_mayo);
delay(245);
writeln('Para el mes de Junio, ingresaron: ', cantidad_junio,' medicamentos, cuyo precio total en dolares es de: USD ', precio_junio);
delay(245);
writeln('Para el mes de Julio, ingresaron: ', cantidad_julio,' medicamentos, cuyo precio total en dolares es de: USD ', precio_julio);
delay(245);
writeln('Para el mes de Agosto, ingresaron: ', cantidad_agosto,' medicamentos, cuyo precio total en dolares es de: USD ', precio_agosto);
delay(245);
writeln('Para el mes de Septiembre, ingresaron: ', cantidad_septiembre,' medicamentos, cuyo precio total en dolares es de: USD ', precio_septiembre);
delay(245);
writeln('Para el mes de Octubre, ingresaron: ', cantidad_octubre,' medicamentos, cuyo precio total en dolares es de: USD ', precio_octubre);
delay(245);
writeln('Para el mes de Noviembre, ingresaron: ', cantidad_noviembre,' medicamentos, cuyo precio total en dolares es de: USD ', precio_noviembre);
delay(245);
writeln('Para el mes de Diciembre, ingresaron: ', cantidad_diciembre,' medicamentos, cuyo precio total en dolares es de: USD ', precio_diciembre);
delay(245);

writeln(' ');
writeln(' ');

Close (sec);
Close (secsal);


end.


