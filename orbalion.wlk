class Equipos {
    const nivelDeEnergiaBase
    const entrenador
    const tecnologiasComplementarias = []
    method agregarTecnologiaComplementaria(tecnologia) {
        tecnologiasComplementarias.add(tecnologia)
    }
    method nombre()
    method energiaTotal(){
        return nivelDeEnergiaBase + self.valoresEnergeticosDeTecnologiasComplementarias()
    }
    method valoresEnergeticosDeTecnologiasComplementarias() {
        return tecnologiasComplementarias.filter({tec => tec.estaActiva()}).sum({
            tecnologia => tecnologia.nivelDeEnergiaBase()
        })
    }
    method esDePrestigioUniversal()
}
class Luminicos inherits Equipos {
    const nivelDeRadiacion
    const nombreDeCristales
    override method nombre() {
        return "Luminicos"
    }
    override method energiaTotal() {
         if (nivelDeRadiacion <= 5000) {
            return super() * 1.1
        } else {
            return super()
        }
    }
    override method esDePrestigioUniversal(){
        return nombreDeCristales.size() >= 3 and entrenador.esEntrenadorDeElite() and tecnologiasComplementarias.filter({tec => tec.estaActiva()}).size() >= 1
    }
}
class Sinteticos inherits Equipos {
    const nivelDeProcesamiento
    const cantidadDeModulosActivos
    const estanCertificados
    override method nombre() {
        return "Sinteticos"
    }
    override method energiaTotal() {
        if (cantidadDeModulosActivos > 5) {
            return super() / 0.8
        } else {
            return super()
        }
    }
    override method esDePrestigioUniversal(){
        return estanCertificados and cantidadDeModulosActivos > 3 and tecnologiasComplementarias.all({tec => tec.estaActiva()})
    }
}
class Etericos inherits Equipos{
    const nivelDeFluctuacionDimensional
    const cantidadDePortalesAbiertos
    override method nombre() {
        return "Etericos"
    }
    override method esDePrestigioUniversal(){
        return nivelDeFluctuacionDimensional  > 75 and cantidadDePortalesAbiertos >= 2 and tecnologiasComplementarias.filter({tec => tec.estaActiva()}).size() >= 2
    }
    override method energiaTotal(){
        if (self.esDePrestigioUniversal()){
            return super() * 1.15
        } else{
            return super()
        }
    }
}

class Entrenadores{
    const ciclosSolaresExperiencia
    const estaEnSintoniaConElEquipo
    const nivelDePresicionEstrategica
    var rol = "Estratega Cuantico"
    method error() {
        return  "Rol no homologado por la FOZ"
    }
    method cambiarRol(nuevoRol) {
        if (nuevoRol == "Estratega Cuantico" ||
    nuevoRol == "Arquitecto de Energia" ||
    nuevoRol == "Guia Mental") {
            rol = nuevoRol
        } else {
         self.error()
        }
    }
    method esEntrenadorDeElite() {
        return ciclosSolaresExperiencia > 10 && self.cumpleConSuRol()
    }
    method cumpleConSuRol() {
        if (rol == "Estratega Cuantico") {
            return nivelDePresicionEstrategica > 80
        } else if (rol == "Arquitecto de Energia") {
            return nivelDePresicionEstrategica > 70
        } else{
            return true
        }
    }
}
class TecnologiasComplementarias {
    const nivelDeEnergiaBase
    const nombre
    const estaActiva
    method nivelDeEnergiaBase() {
        return nivelDeEnergiaBase
    }
    method nombre() {
        return nombre
    }
    method estaActiva() {
        return estaActiva
    }
}
