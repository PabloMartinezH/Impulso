package impulso

class MenuImpulsoController {
    def generarMenu = {
        def grupos = GrupoMenu.listOrderByNombre()
        [grupos:grupos]
    }
    def index = { }
}
