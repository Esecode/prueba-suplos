<template>
  <!-- Vista del formulario para agregar un registro -->
  <div class="container">
    <div class="card">
      <nav>
        <!-- Navegación por pestañas -->
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
            type="button" role="tab" aria-controls="nav-home" aria-selected="true">Información Basica</button>
          <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile"
            type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Cronograma</button>
        </div>
      </nav>
    </div>
    <div class="tab-content" id="nav-tabContent">
      <div class="card-body">
        <form v-on:submit.prevent="agregarRegistro">
          <!-- Pestaña de Información Basica -->
          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"
            tabindex="0">

            <!-- Campo Creador Oferta -->
            <div class="form-group">
              <label for="creador_oferta">Creador Oferta:</label>
              <input type="text" class="form-control" name="creador_oferta" v-model="oferta.creador_oferta"
                id="creador_oferta" aria-describedby="helpId">
            </div>

            <!-- Campo Objeto -->
            <div class="form-group">
              <label for="objeto">Objeto:</label>
              <input type="text" class="form-control" name="objeto" v-model="oferta.objeto" id="objeto"
                aria-describedby="helpId">
            </div>

            <!-- Campo Descripción / Alcance -->
            <div class="form-group">
              <label for="descripcion">Descripción / Alcance</label>
              <textarea class="form-control" name="descripcion" v-model="oferta.descripcion" id="descripcion"
                rows="3"></textarea>
            </div>

            <!-- Campo Actividad -->
            <div class="form-group">
              <label for="actividad">Actividad:</label>
              <input type="text" class="form-control" name="actividad" v-model="oferta.actividad" id="actividad"
                aria-describedby="helpId">
            </div>

            <!-- Campos Moneda y Presupuesto -->
            <div class="col-md-6">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-coins"></i></span>
                </div>
                <select class="form-control" name="id_moneda" v-model="oferta.id_moneda" id="id_moneda">
                  <option value="1">COP</option>
                  <option value="2">USD</option>
                  <option value="3">EUR</option>
                </select>

                <div class="col-md-6">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                    </div>
                    <input type="number" class="form-control" name="presupuesto" v-model="oferta.presupuesto"
                      id="presupuesto" aria-describedby="helpId">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Pestaña de Cronograma -->
          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
            <div class="col-md-6">
              <div class="input-group">
                <div class="col-md-6">
                  <label for="fecha_ini">Fecha Inicio</label>
                  <div class="input-group">
                    <input type="date" class="form-control" name="fecha_ini" v-model="oferta.fecha_ini"
                      id="fecha_ini" aria-describedby="helpId">
                  </div>
                </div>
                <div class="col-md-6">
                  <label for="hora_ini">Hora Inicio</label>
                  <div class="input-group">
                    <input type="time" class="form-control" name="hora_ini" v-model="oferta.hora_ini" id="hora_ini"
                      aria-describedby="helpId">
                  </div>
                </div>
                <div class="col-md-6">
                  <label for="fecha_ini">Fecha Cierre</label>
                  <div class="input-group">
                    <input type="date" class="form-control" name="fecha_fin" v-model="oferta.fecha_fin" id="fecha_fin"
                      aria-describedby="helpId">
                  </div>
                </div>
                <div class="col-md-6">
                  <label for="hora_ini">Hora Inicio</label>
                  <div class="input-group">
                    <input type="time" class="form-control" name="hora_ini" v-model="oferta.hora_fin" id="hora_fin"
                      aria-describedby="helpId">
                  </div>
                </div>
                <div class="form-group">
                  <select class="form-control" name="id_estado" v-model="oferta.id_estado" id="id_estado"
                    v-if="!isSelectHidden">
                    <option value="1">Activo</option>
                    <option value="2">Inactivo</option>
                  </select>
                </div>
              </div>
            </div>
          </div>

          <hr>

          <!-- Botón de Guardar -->
          <div class="col-md-12 center-btn" role="group" aria-label="">
            <button type="submit" class="btn btn-success">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      oferta: {
        id_estado: 1
      },
      isSelectHidden: true
    }
  },
  methods: {
    agregarRegistro() {
      console.log(this.oferta);

      var datosEnviar = {
        creador_oferta: this.oferta.creador_oferta,
        objeto: this.oferta.objeto,
        descripcion: this.oferta.descripcion,
        actividad: this.oferta.actividad,
        id_moneda: this.oferta.id_moneda,
        presupuesto: this.oferta.presupuesto,
        fecha_ini: this.oferta.fecha_ini,
        hora_ini: this.oferta.hora_ini,
        fecha_fin: this.oferta.fecha_fin,
        hora_fin: this.oferta.hora_fin,
        id_estado: this.oferta.id_estado
      };

      fetch('http://localhost/ofertas/?insertar=1', {
          method: "POST",
          body: JSON.stringify(datosEnviar),
        })
        .then(respuesta => respuesta.json())
        .then((datosRespuesta => {
          console.log(datosRespuesta);
          window.location.href = 'listar';
        }));
    }
  }
}
</script>
