
namespace Interfaces
{
    partial class Principal
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Principal));
            this.panelPrincipal = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panelContenedor = new System.Windows.Forms.Panel();
            this.btnmenu = new FontAwesome.Sharp.IconButton();
            this.panelmenu = new System.Windows.Forms.Panel();
            this.btnVentas = new System.Windows.Forms.Button();
            this.btnProductos = new System.Windows.Forms.Button();
            this.btnClientes = new System.Windows.Forms.Button();
            this.btnEmpleados = new System.Windows.Forms.Button();
            this.btnProveedores = new System.Windows.Forms.Button();
            this.btnUbicacion = new System.Windows.Forms.Button();
            this.btnTienda = new System.Windows.Forms.Button();
            this.paneltablero = new System.Windows.Forms.Panel();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.lbltipo = new System.Windows.Forms.Label();
            this.lblNombre = new System.Windows.Forms.Label();
            this.pbFotoEmpleado = new System.Windows.Forms.PictureBox();
            this.pbFototienda = new System.Windows.Forms.PictureBox();
            this.panelHerramientas = new System.Windows.Forms.Panel();
            this.pbMaximizar = new FontAwesome.Sharp.IconPictureBox();
            this.pbMinimizar = new FontAwesome.Sharp.IconPictureBox();
            this.pbCerrar = new FontAwesome.Sharp.IconPictureBox();
            this.timermenu = new System.Windows.Forms.Timer(this.components);
            this.tiempoMenu = new System.Windows.Forms.Timer(this.components);
            this.timerHora = new System.Windows.Forms.Timer(this.components);
            this.timerFecha = new System.Windows.Forms.Timer(this.components);
            this.lblHora = new System.Windows.Forms.Label();
            this.lblFecha = new System.Windows.Forms.Label();
            this.panelPrincipal.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panelContenedor.SuspendLayout();
            this.panelmenu.SuspendLayout();
            this.paneltablero.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbFotoEmpleado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbFototienda)).BeginInit();
            this.panelHerramientas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbMaximizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMinimizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbCerrar)).BeginInit();
            this.SuspendLayout();
            // 
            // panelPrincipal
            // 
            this.panelPrincipal.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelPrincipal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(223)))), ((int)(((byte)(230)))));
            this.panelPrincipal.Controls.Add(this.panel1);
            this.panelPrincipal.Controls.Add(this.panelmenu);
            this.panelPrincipal.Controls.Add(this.panelHerramientas);
            this.panelPrincipal.Location = new System.Drawing.Point(0, 0);
            this.panelPrincipal.Name = "panelPrincipal";
            this.panelPrincipal.Size = new System.Drawing.Size(1264, 681);
            this.panelPrincipal.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panelContenedor);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(200, 25);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1064, 656);
            this.panel1.TabIndex = 2;
            // 
            // panelContenedor
            // 
            this.panelContenedor.AutoSize = true;
            this.panelContenedor.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(223)))), ((int)(((byte)(230)))));
            this.panelContenedor.Controls.Add(this.lblFecha);
            this.panelContenedor.Controls.Add(this.lblHora);
            this.panelContenedor.Controls.Add(this.btnmenu);
            this.panelContenedor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelContenedor.Location = new System.Drawing.Point(0, 0);
            this.panelContenedor.Name = "panelContenedor";
            this.panelContenedor.Size = new System.Drawing.Size(1064, 656);
            this.panelContenedor.TabIndex = 0;
            // 
            // btnmenu
            // 
            this.btnmenu.BackColor = System.Drawing.Color.Transparent;
            this.btnmenu.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnmenu.FlatAppearance.BorderSize = 0;
            this.btnmenu.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnmenu.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnmenu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnmenu.IconChar = FontAwesome.Sharp.IconChar.AngleDoubleLeft;
            this.btnmenu.IconColor = System.Drawing.Color.DarkBlue;
            this.btnmenu.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnmenu.IconSize = 27;
            this.btnmenu.Location = new System.Drawing.Point(10, 6);
            this.btnmenu.Name = "btnmenu";
            this.btnmenu.Padding = new System.Windows.Forms.Padding(3);
            this.btnmenu.Size = new System.Drawing.Size(30, 30);
            this.btnmenu.TabIndex = 0;
            this.btnmenu.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnmenu.UseVisualStyleBackColor = false;
            this.btnmenu.Click += new System.EventHandler(this.btnmenu_Click);
            // 
            // panelmenu
            // 
            this.panelmenu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(102)))), ((int)(((byte)(165)))), ((int)(((byte)(173)))));
            this.panelmenu.Controls.Add(this.btnVentas);
            this.panelmenu.Controls.Add(this.btnProductos);
            this.panelmenu.Controls.Add(this.btnClientes);
            this.panelmenu.Controls.Add(this.btnEmpleados);
            this.panelmenu.Controls.Add(this.btnProveedores);
            this.panelmenu.Controls.Add(this.btnUbicacion);
            this.panelmenu.Controls.Add(this.btnTienda);
            this.panelmenu.Controls.Add(this.paneltablero);
            this.panelmenu.Controls.Add(this.pbFototienda);
            this.panelmenu.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelmenu.Location = new System.Drawing.Point(0, 25);
            this.panelmenu.Name = "panelmenu";
            this.panelmenu.Size = new System.Drawing.Size(200, 656);
            this.panelmenu.TabIndex = 1;
            this.panelmenu.MouseLeave += new System.EventHandler(this.panelmenu_MouseLeave);
            // 
            // btnVentas
            // 
            this.btnVentas.AutoSize = true;
            this.btnVentas.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnVentas.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnVentas.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnVentas.FlatAppearance.BorderSize = 0;
            this.btnVentas.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVentas.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVentas.Image = global::Interfaces.Properties.Resources.ventas;
            this.btnVentas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnVentas.Location = new System.Drawing.Point(0, 456);
            this.btnVentas.Name = "btnVentas";
            this.btnVentas.Padding = new System.Windows.Forms.Padding(0, 5, 0, 0);
            this.btnVentas.Size = new System.Drawing.Size(200, 61);
            this.btnVentas.TabIndex = 15;
            this.btnVentas.Text = "            Ventas";
            this.btnVentas.UseVisualStyleBackColor = true;
            // 
            // btnProductos
            // 
            this.btnProductos.AutoSize = true;
            this.btnProductos.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnProductos.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnProductos.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnProductos.FlatAppearance.BorderSize = 0;
            this.btnProductos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnProductos.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnProductos.Image = global::Interfaces.Properties.Resources.productos;
            this.btnProductos.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnProductos.Location = new System.Drawing.Point(0, 395);
            this.btnProductos.Name = "btnProductos";
            this.btnProductos.Padding = new System.Windows.Forms.Padding(0, 5, 0, 0);
            this.btnProductos.Size = new System.Drawing.Size(200, 61);
            this.btnProductos.TabIndex = 14;
            this.btnProductos.Text = "               Productos";
            this.btnProductos.UseVisualStyleBackColor = true;
            // 
            // btnClientes
            // 
            this.btnClientes.AutoSize = true;
            this.btnClientes.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnClientes.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnClientes.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnClientes.FlatAppearance.BorderSize = 0;
            this.btnClientes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClientes.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClientes.Image = global::Interfaces.Properties.Resources.cliente;
            this.btnClientes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnClientes.Location = new System.Drawing.Point(0, 334);
            this.btnClientes.Name = "btnClientes";
            this.btnClientes.Padding = new System.Windows.Forms.Padding(0, 5, 0, 0);
            this.btnClientes.Size = new System.Drawing.Size(200, 61);
            this.btnClientes.TabIndex = 13;
            this.btnClientes.Text = "            Clientes";
            this.btnClientes.UseVisualStyleBackColor = true;
            // 
            // btnEmpleados
            // 
            this.btnEmpleados.AutoSize = true;
            this.btnEmpleados.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnEmpleados.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnEmpleados.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnEmpleados.FlatAppearance.BorderSize = 0;
            this.btnEmpleados.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnEmpleados.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEmpleados.Image = global::Interfaces.Properties.Resources.empleado;
            this.btnEmpleados.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnEmpleados.Location = new System.Drawing.Point(0, 273);
            this.btnEmpleados.Name = "btnEmpleados";
            this.btnEmpleados.Padding = new System.Windows.Forms.Padding(0, 5, 0, 0);
            this.btnEmpleados.Size = new System.Drawing.Size(200, 61);
            this.btnEmpleados.TabIndex = 12;
            this.btnEmpleados.Text = "                 Empleados";
            this.btnEmpleados.UseVisualStyleBackColor = true;
            // 
            // btnProveedores
            // 
            this.btnProveedores.AutoSize = true;
            this.btnProveedores.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnProveedores.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnProveedores.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnProveedores.FlatAppearance.BorderSize = 0;
            this.btnProveedores.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnProveedores.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnProveedores.Image = ((System.Drawing.Image)(resources.GetObject("btnProveedores.Image")));
            this.btnProveedores.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnProveedores.Location = new System.Drawing.Point(0, 212);
            this.btnProveedores.Name = "btnProveedores";
            this.btnProveedores.Padding = new System.Windows.Forms.Padding(0, 5, 0, 0);
            this.btnProveedores.Size = new System.Drawing.Size(200, 61);
            this.btnProveedores.TabIndex = 11;
            this.btnProveedores.Text = "                    Proveedores";
            this.btnProveedores.UseVisualStyleBackColor = true;
            // 
            // btnUbicacion
            // 
            this.btnUbicacion.AutoSize = true;
            this.btnUbicacion.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnUbicacion.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUbicacion.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnUbicacion.FlatAppearance.BorderSize = 0;
            this.btnUbicacion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUbicacion.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUbicacion.Image = global::Interfaces.Properties.Resources.mapa;
            this.btnUbicacion.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnUbicacion.Location = new System.Drawing.Point(0, 156);
            this.btnUbicacion.Name = "btnUbicacion";
            this.btnUbicacion.Size = new System.Drawing.Size(200, 56);
            this.btnUbicacion.TabIndex = 10;
            this.btnUbicacion.Text = "                 Ubicación";
            this.btnUbicacion.UseVisualStyleBackColor = true;
            // 
            // btnTienda
            // 
            this.btnTienda.AutoSize = true;
            this.btnTienda.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnTienda.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTienda.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnTienda.FlatAppearance.BorderSize = 0;
            this.btnTienda.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTienda.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTienda.Image = global::Interfaces.Properties.Resources.tienda;
            this.btnTienda.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnTienda.Location = new System.Drawing.Point(0, 100);
            this.btnTienda.Name = "btnTienda";
            this.btnTienda.Size = new System.Drawing.Size(200, 56);
            this.btnTienda.TabIndex = 9;
            this.btnTienda.Text = "            Tienda";
            this.btnTienda.UseVisualStyleBackColor = true;
            this.btnTienda.Click += new System.EventHandler(this.btnTienda_Click);
            // 
            // paneltablero
            // 
            this.paneltablero.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.paneltablero.Controls.Add(this.lblUsuario);
            this.paneltablero.Controls.Add(this.lbltipo);
            this.paneltablero.Controls.Add(this.lblNombre);
            this.paneltablero.Controls.Add(this.pbFotoEmpleado);
            this.paneltablero.Location = new System.Drawing.Point(0, 556);
            this.paneltablero.Name = "paneltablero";
            this.paneltablero.Size = new System.Drawing.Size(200, 100);
            this.paneltablero.TabIndex = 8;
            // 
            // lblUsuario
            // 
            this.lblUsuario.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Font = new System.Drawing.Font("Century Gothic", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuario.Location = new System.Drawing.Point(98, 8);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(47, 15);
            this.lblUsuario.TabIndex = 3;
            this.lblUsuario.Text = "Usuario";
            // 
            // lbltipo
            // 
            this.lbltipo.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbltipo.AutoSize = true;
            this.lbltipo.Font = new System.Drawing.Font("Century Gothic", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbltipo.Location = new System.Drawing.Point(98, 75);
            this.lbltipo.Name = "lbltipo";
            this.lbltipo.Size = new System.Drawing.Size(29, 15);
            this.lbltipo.TabIndex = 2;
            this.lbltipo.Text = "Tipo";
            // 
            // lblNombre
            // 
            this.lblNombre.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblNombre.AutoSize = true;
            this.lblNombre.Font = new System.Drawing.Font("Century Gothic", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNombre.Location = new System.Drawing.Point(98, 42);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(50, 15);
            this.lblNombre.TabIndex = 1;
            this.lblNombre.Text = "Nombre";
            // 
            // pbFotoEmpleado
            // 
            this.pbFotoEmpleado.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.pbFotoEmpleado.Location = new System.Drawing.Point(12, 8);
            this.pbFotoEmpleado.Name = "pbFotoEmpleado";
            this.pbFotoEmpleado.Size = new System.Drawing.Size(80, 80);
            this.pbFotoEmpleado.TabIndex = 0;
            this.pbFotoEmpleado.TabStop = false;
            // 
            // pbFototienda
            // 
            this.pbFototienda.Dock = System.Windows.Forms.DockStyle.Top;
            this.pbFototienda.Location = new System.Drawing.Point(0, 0);
            this.pbFototienda.Name = "pbFototienda";
            this.pbFototienda.Size = new System.Drawing.Size(200, 100);
            this.pbFototienda.TabIndex = 0;
            this.pbFototienda.TabStop = false;
            // 
            // panelHerramientas
            // 
            this.panelHerramientas.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(59)))), ((int)(((byte)(70)))));
            this.panelHerramientas.Controls.Add(this.pbMaximizar);
            this.panelHerramientas.Controls.Add(this.pbMinimizar);
            this.panelHerramientas.Controls.Add(this.pbCerrar);
            this.panelHerramientas.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelHerramientas.Location = new System.Drawing.Point(0, 0);
            this.panelHerramientas.Name = "panelHerramientas";
            this.panelHerramientas.Size = new System.Drawing.Size(1264, 25);
            this.panelHerramientas.TabIndex = 0;
            this.panelHerramientas.MouseDown += new System.Windows.Forms.MouseEventHandler(this.panelHerramientas_MouseDown);
            // 
            // pbMaximizar
            // 
            this.pbMaximizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbMaximizar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(2)))), ((int)(((byte)(46)))), ((int)(((byte)(225)))));
            this.pbMaximizar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pbMaximizar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(206)))), ((int)(((byte)(6)))));
            this.pbMaximizar.IconChar = FontAwesome.Sharp.IconChar.Clone;
            this.pbMaximizar.IconColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(206)))), ((int)(((byte)(6)))));
            this.pbMaximizar.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.pbMaximizar.IconSize = 25;
            this.pbMaximizar.Location = new System.Drawing.Point(1190, 0);
            this.pbMaximizar.Name = "pbMaximizar";
            this.pbMaximizar.Size = new System.Drawing.Size(25, 25);
            this.pbMaximizar.TabIndex = 3;
            this.pbMaximizar.TabStop = false;
            this.pbMaximizar.Click += new System.EventHandler(this.pbMaximizar_Click);
            this.pbMaximizar.MouseLeave += new System.EventHandler(this.pbMaximizar_MouseLeave);
            this.pbMaximizar.MouseHover += new System.EventHandler(this.pbMaximizar_MouseHover);
            // 
            // pbMinimizar
            // 
            this.pbMinimizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbMinimizar.BackColor = System.Drawing.Color.Transparent;
            this.pbMinimizar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pbMinimizar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(241)))), ((int)(((byte)(5)))));
            this.pbMinimizar.IconChar = FontAwesome.Sharp.IconChar.MinusCircle;
            this.pbMinimizar.IconColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(241)))), ((int)(((byte)(5)))));
            this.pbMinimizar.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.pbMinimizar.IconSize = 25;
            this.pbMinimizar.Location = new System.Drawing.Point(1146, 0);
            this.pbMinimizar.Name = "pbMinimizar";
            this.pbMinimizar.Size = new System.Drawing.Size(25, 25);
            this.pbMinimizar.TabIndex = 2;
            this.pbMinimizar.TabStop = false;
            this.pbMinimizar.Click += new System.EventHandler(this.pbMinimizar_Click);
            this.pbMinimizar.MouseLeave += new System.EventHandler(this.pbMinimizar_MouseLeave);
            this.pbMinimizar.MouseHover += new System.EventHandler(this.pbMinimizar_MouseHover);
            // 
            // pbCerrar
            // 
            this.pbCerrar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbCerrar.BackColor = System.Drawing.Color.Transparent;
            this.pbCerrar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pbCerrar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(236)))), ((int)(((byte)(5)))), ((int)(((byte)(1)))));
            this.pbCerrar.IconChar = FontAwesome.Sharp.IconChar.DoorClosed;
            this.pbCerrar.IconColor = System.Drawing.Color.FromArgb(((int)(((byte)(236)))), ((int)(((byte)(5)))), ((int)(((byte)(1)))));
            this.pbCerrar.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.pbCerrar.IconSize = 25;
            this.pbCerrar.Location = new System.Drawing.Point(1227, 0);
            this.pbCerrar.Name = "pbCerrar";
            this.pbCerrar.Size = new System.Drawing.Size(25, 25);
            this.pbCerrar.TabIndex = 1;
            this.pbCerrar.TabStop = false;
            this.pbCerrar.Click += new System.EventHandler(this.pbCerrar_Click);
            this.pbCerrar.MouseLeave += new System.EventHandler(this.pbCerrar_MouseLeave);
            this.pbCerrar.MouseHover += new System.EventHandler(this.pbCerrar_MouseHover);
            // 
            // timermenu
            // 
            this.timermenu.Interval = 80;
            this.timermenu.Tick += new System.EventHandler(this.timermenu_Tick);
            // 
            // tiempoMenu
            // 
            this.tiempoMenu.Interval = 3000;
            this.tiempoMenu.Tick += new System.EventHandler(this.tiempoMenu_Tick);
            // 
            // timerHora
            // 
            this.timerHora.Enabled = true;
            this.timerHora.Tick += new System.EventHandler(this.timerHora_Tick);
            // 
            // timerFecha
            // 
            this.timerFecha.Enabled = true;
            this.timerFecha.Tick += new System.EventHandler(this.timerFecha_Tick);
            // 
            // lblHora
            // 
            this.lblHora.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblHora.AutoSize = true;
            this.lblHora.Font = new System.Drawing.Font("Century Gothic", 48F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHora.ForeColor = System.Drawing.Color.Teal;
            this.lblHora.Location = new System.Drawing.Point(418, 257);
            this.lblHora.Name = "lblHora";
            this.lblHora.Size = new System.Drawing.Size(0, 77);
            this.lblHora.TabIndex = 1;
            // 
            // lblFecha
            // 
            this.lblFecha.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("Century Gothic", 26.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFecha.ForeColor = System.Drawing.Color.Navy;
            this.lblFecha.Location = new System.Drawing.Point(275, 353);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(0, 42);
            this.lblFecha.TabIndex = 2;
            this.lblFecha.Click += new System.EventHandler(this.lblFecha_Click);
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(1264, 681);
            this.ControlBox = false;
            this.Controls.Add(this.panelPrincipal);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MinimumSize = new System.Drawing.Size(500, 500);
            this.Name = "Principal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Principal";
            this.Load += new System.EventHandler(this.Principal_Load);
            this.panelPrincipal.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panelContenedor.ResumeLayout(false);
            this.panelContenedor.PerformLayout();
            this.panelmenu.ResumeLayout(false);
            this.panelmenu.PerformLayout();
            this.paneltablero.ResumeLayout(false);
            this.paneltablero.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbFotoEmpleado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbFototienda)).EndInit();
            this.panelHerramientas.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbMaximizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMinimizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbCerrar)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelPrincipal;
        private System.Windows.Forms.Panel panelHerramientas;
        private FontAwesome.Sharp.IconPictureBox pbMaximizar;
        private FontAwesome.Sharp.IconPictureBox pbMinimizar;
        private FontAwesome.Sharp.IconPictureBox pbCerrar;
        private System.Windows.Forms.Panel panelmenu;
        private System.Windows.Forms.Timer timermenu;
        private System.Windows.Forms.Timer tiempoMenu;
        private System.Windows.Forms.Panel paneltablero;
        private System.Windows.Forms.PictureBox pbFototienda;
        private FontAwesome.Sharp.IconButton btnmenu;
        public System.Windows.Forms.Label lbltipo;
        public System.Windows.Forms.Label lblNombre;
        public System.Windows.Forms.PictureBox pbFotoEmpleado;
        public System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnTienda;
        private System.Windows.Forms.Button btnVentas;
        private System.Windows.Forms.Button btnProductos;
        private System.Windows.Forms.Button btnClientes;
        private System.Windows.Forms.Button btnEmpleados;
        private System.Windows.Forms.Button btnProveedores;
        private System.Windows.Forms.Button btnUbicacion;
        private System.Windows.Forms.Panel panelContenedor;
        private System.Windows.Forms.Label lblFecha;
        private System.Windows.Forms.Label lblHora;
        private System.Windows.Forms.Timer timerHora;
        private System.Windows.Forms.Timer timerFecha;
    }
}