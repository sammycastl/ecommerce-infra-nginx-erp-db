Descripción
Este proyecto Terraform implementa una infraestructura completa para una plataforma de e-commerce en Azure, incluyendo:
* Almacenamiento Blob para contenido estático
* Base de datos PostgreSQL flexible
* Servidor ERP en una máquina virtual Linux
* Gateway NGINX como aplicación web

Prerrequisitos
1. Azure CLI instalado y configurado
2. Terraform (v1.0+) instalado
3. Acceso a una suscripción de Azure con permisos suficientes
4. SSH key pair (opcional, para acceso a la VM ERP)

Estructura del Proyecto
├── blob.tf          # Configuración de Blob Storage
├── database.tf      # Configuración de PostgreSQL Flexible Server
├── erp.tf           # Configuración de la VM ERP y red asociada
├── main.tf          # Configuración del proveedor y grupo de recursos
├── nginx.tf         # Configuración del gateway NGINX
├── outputs.tf       # Salidas de la infraestructura
└── variables.tf     # Variables configurables

Variables Configurables
Las principales variables se definen en variables.tf y pueden ser modificadas:
Variable	Descripción	Valor por defecto
subscription_id	ID de suscripción Azure	"12345678-1234-1234-1234-123456789012"
location	Región de Azure	"Central US"
environment	Entorno (dev, staging, prod)	"dev"
project	Nombre del proyecto	"ecommerce"
tags	Tags para los recursos	{createdBy = "Nelson Martinez", date = "June-2025"}
db_admin_username	Usuario admin de PostgreSQL	"psqladmin"
db_admin_password	Contraseña admin de PostgreSQL	- (requerida)
ssh_public_key	Clave pública SSH para la VM	"" (opcional)

1. Inicializar Terraform: terraform init 
2. Revisar el plan de ejecución: terraform plan 
3. Aplicar la configuración: terraform apply  Durante la ejecución, se solicitarán las variables no definidas con valores por defecto.

Recursos Implementados
1. Blob Storage
* Nombre: ecommercesa{project}{environment}
* Tipo: StorageV2, LRS
* Características:
    * Versioning habilitado
    * Change feed habilitado
* Contenedor: ecommerce-content (acceso privado)
2. PostgreSQL Flexible Server
* Nombre: psql-{project}-{environment}-primary
* Versión: PostgreSQL 12
* SKU: GP_Standard_D2s_v3
* Almacenamiento: 32GB
* Alta disponibilidad: ZoneRedundant
* Backup: Retención de 7 días

3. Infraestructura ERP
* Red Virtual: erp-vnet-{project}-{environment} (10.0.0.0/16)
* Subnet: erp-subnet (10.0.1.0/24)
* Máquina Virtual:
    * Nombre: erp1-{project}-{environment}
    * Tamaño: Standard_B2s
    * SO: Ubuntu Server 24.04 LTS
    * Autenticación: SSH key

4. Gateway NGINX
* App Service Plan: F1 (Linux)
* Aplicación Web: Implementación de contenedor Docker (nginx:latest)
* Configuración: Puerto 80 expuesto

Salidas
Después de la implementación, Terraform mostrará las siguientes salidas:
Salida	Descripción
blob_storage_name	Nombre de la cuenta de Blob Storage
blob_storage_primary_access_key	Clave de acceso primaria (sensible)
nginx_endpoint	URL del gateway NGINX
primary_db_fqdn	FQDN del servidor PostgreSQL
erp1_private_ip	IP privada del servidor ERP

Recomendaciones
1. Ambientes: Cambiar la variable environment para implementar en diferentes ambientes (dev, staging, prod).
2. Seguridad:
    * Rotar las credenciales de PostgreSQL después de la implementación
    * Restringir el acceso al Blob Storage según sea necesario
3. Costos:
    * El plan F1 de App Service es gratuito pero con limitaciones
    * Considerar ajustar los SKUs para producción
4. Monitorización:
    * Habilitar Azure Monitor para los recursos críticos
    * Configurar alertas para la base de datos y la VM

Mantenimiento
Para actualizar la infraestructura:
1. Modificar los archivos .tf correspondientes
2. Ejecutar: bash  Copy  Download   terraform plan
3. terraform apply 
Para destruir todos los recursos: terraform destroy
