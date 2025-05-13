import cosas2.*
object camion {

const property tara = 1000
const property cosasALlevar = []

method camionSobreCargado () {

}

method cargar(unaCosa) {
    cosasALlevar.add(unaCosa)
    unaCosa.consecuenciaCarga()
}

method descargar(unaCosa){
    cosasALlevar.remove(unaCosa)
}

method pesoTotalDelCamion() = tara + cosasALlevar.sum({unaCosa => unaCosa.peso()})

method pesoCargadosTodosPar() = cosasALlevar.all({unaCosa => unaCosa.peso().even()})

method hayAlgunaCosaPesa(valor) = cosasALlevar.any({unaCosa => unaCosa.peso() == valor})

method primeraCosaConNivelPeligrosidad (unNivel) = cosasALlevar.find({unaCosa => unaCosa.peligrosidad() == unNivel})

method cosasQueSuperanUnNivelPeligrosidad(unNivel) = cosasALlevar.filter({unaCosa => unaCosa>unNivel}) 

method excesoPesoPermitido() = self.pesoTotalDelCamion() > 2500

method puedeCircularEnRuta (unNivel) = 

    !self.excesoPesoPermitido() && self.cosasQueSuperanUnNivelPeligrosidad(unNivel).isEmpty()

method hayAlgoPesoEntreMaxYMin (pesoMinimo,pesoMaximo) = 
    
    cosasALlevar.any({unaCosa => unaCosa.between(pesoMinimo, pesoMaximo)})

method cosaMasPesadaCargada () = cosasALlevar.max({unaCosa => unaCosa.peso()})

method cargarVariasCosas (listaDeCosas) {
    cosasALlevar.addAll(listaDeCosas)
    cosasALlevar.forEach({unaCosa => unaCosa.consecuenciaCarga()})
}

}