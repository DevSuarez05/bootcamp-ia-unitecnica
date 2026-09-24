/* Club Náutico - conexión HTML ↔ PHP mediante Fetch API */
const modulos={
 'socios.html':{php:'socios.php',clave:'documento',titulo:'Socios'},
 'barcos.html':{php:'barcos.php',clave:'no_matricula',titulo:'Barcos'},
 'salidas.html':{php:'salidas.php',clave:'Id',titulo:'Salidas'},
 'patrones.html':{php:'patrones.php',clave:'documento',titulo:'Patrones'}
};

const modulo=()=>modulos[location.pathname.split('/').pop()];

function estado(msg,tipo='info'){
 let el=document.querySelector('#estado');
 if(!el){el=document.createElement('div');el.id='estado';document.querySelector('main')?.prepend(el)}
 el.className=`status-message ${tipo}`;el.textContent=msg;
 clearTimeout(window._estado);window._estado=setTimeout(()=>el.remove(),4000);
}

async function enviar(datos){
 const m=modulo();
 const r=await fetch(m.php,{method:'POST',body:datos,headers:{Accept:'application/json'}});
 const j=await r.json();
 if(!r.ok||!j.ok) throw new Error(j.mensaje||'Error en la operación');
 return j;
}

async function listar(){
 const m=modulo(), cont=document.querySelector('#listado');
 if(!m||!cont)return;
 try{
  const r=await fetch(`${m.php}?accion=listar`,{headers:{Accept:'application/json'}});
  const j=await r.json();
  if(!r.ok||!j.ok)throw new Error(j.mensaje||'No se pudieron cargar los registros');
  renderTabla(j.datos||[],m,cont);
 }catch(e){estado(e.message,'error')}
}

function renderTabla(datos,m,cont){
 if(!datos.length){cont.innerHTML='<div class="empty-state"><strong>No hay registros</strong><span>Aún no existen datos para mostrar.</span></div>';return}
 const columnas=Object.keys(datos[0]);
 const th=columnas.map(c=>`<th>${seguro(c)}</th>`).join('');
 const rows=datos.map(row=>`<tr>${columnas.map(c=>`<td>${seguro(row[c]??'')}</td>`).join('')}<td class="actions"><button class="table-btn edit" data-edit="${encodeURIComponent(JSON.stringify(row))}">Editar</button><button class="table-btn delete" data-delete="${encodeURIComponent(String(row[m.clave]??''))}">Eliminar</button></td></tr>`).join('');
 cont.innerHTML=`<div class="table-wrapper"><table class="data-table"><thead><tr>${th}<th>Acciones</th></tr></thead><tbody>${rows}</tbody></table></div>`;
 cont.querySelectorAll('[data-edit]').forEach(b=>b.addEventListener('click',()=>editar(JSON.parse(decodeURIComponent(b.dataset.edit)))));
 cont.querySelectorAll('[data-delete]').forEach(b=>b.addEventListener('click',()=>eliminar(decodeURIComponent(b.dataset.delete))));
}

function editar(row){
 const f=document.querySelector('form');if(!f)return;
 Object.entries(row).forEach(([k,v])=>{const el=f.elements[k];if(el)el.value=v??''});
 f.dataset.modo='actualizar';
 const accion=f.elements.accion;if(accion)accion.value='actualizar';
 const btn=f.querySelector('button[type=submit]');if(btn)btn.textContent='Actualizar registro';
 f.scrollIntoView({behavior:'smooth'});estado('Registro cargado para edición.','info');
}

async function eliminar(valor){
 const m=modulo();if(!m)return;
 if(!confirm(`¿Deseas eliminar este registro de ${m.titulo}?`))return;
 const d=new FormData();d.set('accion','eliminar');d.set(m.clave,valor);
 try{const j=await enviar(d);estado(j.mensaje,'success');listar()}catch(e){estado(e.message,'error')}
}

function seguro(v){const d=document.createElement('div');d.textContent=String(v);return d.innerHTML}

document.addEventListener('DOMContentLoaded',()=>{
 const m=modulo(),f=document.querySelector('form');
 if(f&&m){
  f.addEventListener('submit',async e=>{
   e.preventDefault();
   const d=new FormData(f);d.set('accion',f.dataset.modo==='actualizar'?'actualizar':'crear');
   try{
    estado(d.get('accion')==='crear'?'Guardando información...':'Actualizando información...','info');
    const j=await enviar(d);estado(j.mensaje,'success');f.reset();delete f.dataset.modo;if(f.elements.accion)f.elements.accion.value='crear';const b=f.querySelector('button[type=submit]');if(b)b.textContent='Guardar registro';listar();
   }catch(e){estado(e.message,'error')}
  });
 }
 listar();
});
