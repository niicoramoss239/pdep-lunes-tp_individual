

## Explicaciones Y Justificaciones de lo aplicado en el TP

existen muchas entradas, muchos asistentes y varias bandas, todos con la misma estructura y comportamiento, por eso se usa CLASES. Productora es un unica por eso la defini como un WKO.

Se aplico el concepto de SUPERCLASE con "Banda", la cual hereda a la subclases bandaDeTrap, bandaDeRock, etc. se creo un METODO ABSTRACTO con metodos comunes entre todas las bandas como popularidad, presupuesto, y gastoextra, que este ultimo lo termine definiendo como un metodo en vez de una atributo, ya que en la subclase de bandaIndie, este valor depende de otro atributo, entonces ya no podríamos setearlo directamente por ejemplo con "class BandaIndie inherits Banda (gastoExtra = 500 * cantidadIntrumentos)". Tambien en cada subclase aplique los correspondientes override para los methodos (REDEFINICION).
En ese mismo area y con esos metodos se aplica tambien directamente POLIMORFISMO ya que todas las bandas entiendes esos mismos mensajes, productora los usa indistintamente con cualquier banda sin importar que tipo de banda sea.

Tambien se aplico encapsulamiento ya que por ejemplo el dinero y el historial de entradas se modifican solo a traves de comprar entrada, al igual que bonificar, para modificar el descuento, Asi no se expone el atributo a ser modificador de otra manera.


