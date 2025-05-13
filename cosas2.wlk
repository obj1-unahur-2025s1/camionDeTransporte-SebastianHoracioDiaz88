import camion2.*

object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method cantidadBultos () = 1
    method consecuenciaCarga () {

    }
}


object bumblebee {
    var estado = auto
    method estado () = estado
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformarse() {
        estado = estado.nuevoEstado()
    }
    method cantidadBultos () = 2
    method consecuenciaCarga() {
        estado = robot
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
    method cantidadBultos () = if(cantidad<=100) 1 else if(cantidad.between(101,300)) 2  else 3
    method consecuenciaCarga () { cantidad = cantidad + 12 }
}

object arena {
    method peligrosidad () = 1
    var peso = 0
    method peso () = peso 
    method aumentarPeso (unPeso) {
        peso = unPeso
    }
    method cantidadBultos () = 1
    method consecuenciaCarga () { peso = ((peso - 10).max(0)) }
}

object bateriaAntiAerea {
    var property estado = otroEstado
    method peso() = estado.peso()
    method transformarse () {
        estado = estado.nuevoEstado()
    }
    method peligrosidad () = estado.peligrosidad()
    method cantidadBultos () = estado.cantidadBultos()
    method consecuenciaCarga() {
        estado = estado.nuevoEstado()
    }
}

object misiles {
    method peso() = 300
    method nuevoEstado () = otroEstado
    method peligrosidad() = 100
    method cantidadBultos () = 1
}

object otroEstado {
    method peso () = 200
    method nuevoEstado () = misiles
    method peligrosidad() = 0
    method cantidadBultos () = 2
}

object contenedor {
    const property listaCosas = []
    method cantidadBultos () = 1 + listaCosas.sum({unaCosa => unaCosa.Cantidad()})
    method peso () = 100 + listaCosas.sum({unaCosa => unaCosa.peso()})
    method peligrosidad () = if (listaCosas.isEmpty()) 0 else listaCosas.max({unaCosa => unaCosa.peligrosidad()}).peligrosidad()
    method consecuenciaCarga () = listaCosas.forEach({unaCosa => unaCosa.consecuenciaCarga()})
}

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200 
    method cantidadBultos () = 1
    method consecuenciaCarga () = peso + 15
}

object embalajeSeguridad {

    var property cosa = ladrillos
    method peso() = cosa.peso()
    method peligrosidad() = cosa.peligrosidad() * 0.5
    method cantidadBultos () = 1
    method consecuenciaCarga () {

    }

}
