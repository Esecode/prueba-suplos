<template>
  <!-- Vista de inicio -->
  <div class="container">
    <div class="card text-center">
      <div class="card-body">
        <h5 class="card-title">Procesos / Eventos</h5>
      </div>
    </div>
  </div>

  <!-- Opciones de acciones -->
  <div class="container">
    <div class="card bg-primary text-white">
      <div class="card-body">
        <div class="row">
          <!-- Botón para crear -->
          <div class="col-md-4">
            <router-link to="/crear" class="btn btn-primary btn-block">Crear</router-link>
          </div>
          <!-- Botón para copiar -->
          <div class="col-md-4">
            <router-link to="/editar" class="btn btn-primary btn-block">Copiar</router-link>
          </div>
          <!-- Botón para consultar -->
          <div class="col-md-4">
            <router-link to="/listar" class="btn btn-primary btn-block">Consultar</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.router-link {
  color: white;
}
.btn {
  margin-left: 10px;
}
</style>

<script>
export default {
  name: 'HomeView',
}
</script>
