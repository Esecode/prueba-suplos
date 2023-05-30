<template>
    <!-- Vista de listado de ofertas -->
    <div class="container">
      <div class="card">
        <div class="card-header">
          Listar
        </div>
        <div class="card-body">
          <table class="table">
            <thead>
              <tr>
                <th>ID Oferta</th>
                <th>Creador oferta</th>
                <th>Objeto</th>
                <th>Actividad</th>
                <th>Descripcion</th>
                <th>Moneda</th>
                <th>Presupesto</th>
                <th>Fecha de inicio</th>
                <th>Hora de inicio</th>
                <th>Fecha de cierre</th>
                <th>Hora de cierre</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <!-- Itera sobre las ofertas -->
              <tr v-for="oferta in ofertas" :key="oferta.id_oferta">
                <td>{{ oferta.id_oferta }}</td>
                <td>{{ oferta.creador_oferta }}</td>
                <td>{{ oferta.objeto }}</td>
                <td>{{ oferta.actividad }}</td>
                <td>{{ oferta.descripcion }}</td>
                <td>{{ oferta.tipo_moneda }}</td>
                <td>{{ oferta.presupuesto }}</td>
                <td>{{ oferta.fecha_ini }}</td>
                <td>{{ oferta.hora_ini }}</td>
                <td>{{ oferta.fecha_fin }}</td>
                <td>{{ oferta.hora_fin }}</td>
                <td>{{ oferta.tipo_estado }}</td>
              </tr>
            </tbody>
          </table>
  
          <!-- Botón para generar reporte Excel -->
          <button class="btn btn-primary" @click="generarReporteExcel">Generar Reporte Excel</button>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import XLSX from 'xlsx';
  
  export default {
    name: 'HelloWorld',
    data() {
      return {
        ofertas: [],
      };
    },
    created() {
      this.consultarOfertas();
    },
    methods: {
      generarReporteExcel() {
        // Crear una nueva instancia de Workbook
        const workbook = XLSX.utils.book_new();
  
        // Crear una hoja de cálculo
        const worksheet = XLSX.utils.table_to_sheet(this.$refs.table);
  
        // Agregar la hoja de cálculo al libro
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Ofertas');
  
        // Generar el archivo Excel
        XLSX.writeFile(workbook, 'reporte_ofertas.xlsx');
      },
      consultarOfertas() {
        fetch('http://localhost/ofertas/')
          .then(respuesta => respuesta.json())
          .then((datosRespuesta) => {
            console.log(datosRespuesta);
            this.ofertas = [];
            if (typeof datosRespuesta[0].success === 'undefined') {
              this.ofertas = datosRespuesta;
            }
          })
          .catch(console.log);
      },
    },
  };
  </script>
  