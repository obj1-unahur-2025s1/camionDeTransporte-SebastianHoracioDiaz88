import camion.*

object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}


object bumblebee {
    var estado = auto
    method estado () = estado
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformarse() {
        estado = estado.nuevoEstado()
    }
}

object auto {
    method peligrosidad () = 15
    method nuevoEstado () = robot
}

object robot {
    method peligrosidad () = 30
    method nuevoEstado () = auto
}

object ladrillos {
    var property cantidad = 0
    method peso() = 2 * cantidad
    method peligrosidad() = 2
    
}

object arena {
    method peligrosidad () = 1
    var property peso = 0 
}

object bateriaAntiAerea {
    var estado = misiles
    method peso() = estado.peso()
    method nuevoEstado () {
        estado = estado.nuevoEstado()
    }
    method peligrosidad () = estado.peligrosidad()

}

object misiles {
    method peso() = 300
    method nuevoEstado () = otroEstado
    method peligrosidad() = 100
}

object otroEstado {
    method peso () = 200
    method nuevoEstado () = misiles
    method peligrosidad() = 0
}

object contenedor {
    const property listaCosas = []
    method peso () = 100 + listaCosas.sum({unaCosa => unaCosa.peso()})
    method peligrosidad () = if (listaCosas.isEmpty()) 0 else listaCosas.max({unaCosa => unaCosa.peligrosidad()}).peligrosidad()
}

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200 
}

object embalajeSeguridad {

    var property cosa = ladrillos
    method peso() = cosa.peso()
    method peligrosidad() = cosa.peligrosidad() * 0.5

}

