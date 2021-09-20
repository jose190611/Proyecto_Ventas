
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
            this.panelPrincipal = new System.Windows.Forms.Panel();
            this.btnmenu = new FontAwesome.Sharp.IconButton();
            this.panelmenu = new System.Windows.Forms.Panel();
            this.paneltablero = new System.Windows.Forms.Panel();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.lbltipo = new System.Windows.Forms.Label();
            this.lblNombre = new System.Windows.Forms.Label();
            this.pbFotoEmpleado = new System.Windows.Forms.PictureBox();
            this.iconButton7 = new FontAwesome.Sharp.IconButton();
            this.iconButton6 = new FontAwesome.Sharp.IconButton();
            this.iconButton5 = new FontAwesome.Sharp.IconButton();
            this.iconButton4 = new FontAwesome.Sharp.IconButton();
            this.iconButton3 = new FontAwesome.Sharp.IconButton();
            this.iconButton2 = new FontAwesome.Sharp.IconButton();
            this.iconButton1 = new FontAwesome.Sharp.IconButton();
            this.pbFototienda = new System.Windows.Forms.PictureBox();
            this.panelHerramientas = new System.Windows.Forms.Panel();
            this.pbMaximizar = new FontAwesome.Sharp.IconPictureBox();
            this.pbMinimizar = new FontAwesome.Sharp.IconPictureBox();
            this.pbCerrar = new FontAwesome.Sharp.IconPictureBox();
            this.timermenu = new System.Windows.Forms.Timer(this.components);
            this.tiempoMenu = new System.Windows.Forms.Timer(this.components);
            this.panel1 = new System.Windows.Forms.Panel();
            this.pbAmpliarForm = new FontAwesome.Sharp.IconPictureBox();
            this.panelPrincipal.SuspendLayout();
            this.panelmenu.SuspendLayout();
            this.paneltablero.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbFotoEmpleado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbFototienda)).BeginInit();
            this.panelHerramientas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbMaximizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMinimizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbCerrar)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbAmpliarForm)).BeginInit();
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
            this.panelmenu.Controls.Add(this.paneltablero);
            this.panelmenu.Controls.Add(this.iconButton7);
            this.panelmenu.Controls.Add(this.iconButton6);
            this.panelmenu.Controls.Add(this.iconButton5);
            this.panelmenu.Controls.Add(this.iconButton4);
            this.panelmenu.Controls.Add(this.iconButton3);
            this.panelmenu.Controls.Add(this.iconButton2);
            this.panelmenu.Controls.Add(this.iconButton1);
            this.panelmenu.Controls.Add(this.pbFototienda);
            this.panelmenu.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelmenu.Location = new System.Drawing.Point(0, 25);
            this.panelmenu.Name = "panelmenu";
            this.panelmenu.Size = new System.Drawing.Size(200, 656);
            this.panelmenu.TabIndex = 1;
            this.panelmenu.MouseLeave += new System.EventHandler(this.panelmenu_MouseLeave);
            // 
            // paneltablero
            // 
            this.paneltablero.Controls.Add(this.lblUsuario);
            this.paneltablero.Controls.Add(this.lbltipo);
            this.paneltablero.Controls.Add(this.lblNombre);
            this.paneltablero.Controls.Add(this.pbFotoEmpleado);
            this.paneltablero.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.paneltablero.Location = new System.Drawing.Point(0, 556);
            this.paneltablero.Name = "paneltablero";
            this.paneltablero.Size = new System.Drawing.Size(200, 100);
            this.paneltablero.TabIndex = 8;
            // 
            // lblUsuario
            // 
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
            this.pbFotoEmpleado.Location = new System.Drawing.Point(12, 8);
            this.pbFotoEmpleado.Name = "pbFotoEmpleado";
            this.pbFotoEmpleado.Size = new System.Drawing.Size(80, 80);
            this.pbFotoEmpleado.TabIndex = 0;
            this.pbFotoEmpleado.TabStop = false;
            // 
            // iconButton7
            // 
            this.iconButton7.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton7.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton7.IconColor = System.Drawing.Color.Black;
            this.iconButton7.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton7.Location = new System.Drawing.Point(0, 400);
            this.iconButton7.Name = "iconButton7";
            this.iconButton7.Size = new System.Drawing.Size(200, 50);
            this.iconButton7.TabIndex = 7;
            this.iconButton7.Text = "iconButton7";
            this.iconButton7.UseVisualStyleBackColor = true;
            // 
            // iconButton6
            // 
            this.iconButton6.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton6.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton6.IconColor = System.Drawing.Color.Black;
            this.iconButton6.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton6.Location = new System.Drawing.Point(0, 350);
            this.iconButton6.Name = "iconButton6";
            this.iconButton6.Size = new System.Drawing.Size(200, 50);
            this.iconButton6.TabIndex = 6;
            this.iconButton6.Text = "iconButton6";
            this.iconButton6.UseVisualStyleBackColor = true;
            // 
            // iconButton5
            // 
            this.iconButton5.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton5.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton5.IconColor = System.Drawing.Color.Black;
            this.iconButton5.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton5.Location = new System.Drawing.Point(0, 300);
            this.iconButton5.Name = "iconButton5";
            this.iconButton5.Size = new System.Drawing.Size(200, 50);
            this.iconButton5.TabIndex = 5;
            this.iconButton5.Text = "iconButton5";
            this.iconButton5.UseVisualStyleBackColor = true;
            // 
            // iconButton4
            // 
            this.iconButton4.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton4.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton4.IconColor = System.Drawing.Color.Black;
            this.iconButton4.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton4.Location = new System.Drawing.Point(0, 250);
            this.iconButton4.Name = "iconButton4";
            this.iconButton4.Size = new System.Drawing.Size(200, 50);
            this.iconButton4.TabIndex = 4;
            this.iconButton4.Text = "iconButton4";
            this.iconButton4.UseVisualStyleBackColor = true;
            // 
            // iconButton3
            // 
            this.iconButton3.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton3.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton3.IconColor = System.Drawing.Color.Black;
            this.iconButton3.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton3.Location = new System.Drawing.Point(0, 200);
            this.iconButton3.Name = "iconButton3";
            this.iconButton3.Size = new System.Drawing.Size(200, 50);
            this.iconButton3.TabIndex = 3;
            this.iconButton3.Text = "iconButton3";
            this.iconButton3.UseVisualStyleBackColor = true;
            // 
            // iconButton2
            // 
            this.iconButton2.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton2.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton2.IconColor = System.Drawing.Color.Black;
            this.iconButton2.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton2.Location = new System.Drawing.Point(0, 150);
            this.iconButton2.Name = "iconButton2";
            this.iconButton2.Size = new System.Drawing.Size(200, 50);
            this.iconButton2.TabIndex = 2;
            this.iconButton2.Text = "iconButton2";
            this.iconButton2.UseVisualStyleBackColor = true;
            // 
            // iconButton1
            // 
            this.iconButton1.Dock = System.Windows.Forms.DockStyle.Top;
            this.iconButton1.IconChar = FontAwesome.Sharp.IconChar.None;
            this.iconButton1.IconColor = System.Drawing.Color.Black;
            this.iconButton1.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.iconButton1.Location = new System.Drawing.Point(0, 100);
            this.iconButton1.Name = "iconButton1";
            this.iconButton1.Size = new System.Drawing.Size(200, 50);
            this.iconButton1.TabIndex = 1;
            this.iconButton1.Text = "iconButton1";
            this.iconButton1.UseVisualStyleBackColor = true;
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
            this.panelHerramientas.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
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
            this.pbMaximizar.BackColor = System.Drawing.Color.Transparent;
            this.pbMaximizar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pbMaximizar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(206)))), ((int)(((byte)(6)))));
            this.pbMaximizar.IconChar = FontAwesome.Sharp.IconChar.Clone;
            this.pbMaximizar.IconColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(206)))), ((int)(((byte)(6)))));
            this.pbMaximizar.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.pbMaximizar.IconSize = 25;
            this.pbMaximizar.Location = new System.Drawing.Point(1182, 0);
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
            this.pbMinimizar.Location = new System.Drawing.Point(1142, 0);
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
            this.pbCerrar.Location = new System.Drawing.Point(1223, 0);
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
            // panel1
            // 
            this.panel1.Controls.Add(this.pbAmpliarForm);
            this.panel1.Controls.Add(this.btnmenu);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(200, 25);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1064, 656);
            this.panel1.TabIndex = 2;
            // 
            // pbAmpliarForm
            // 
            this.pbAmpliarForm.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(223)))), ((int)(((byte)(230)))));
            this.pbAmpliarForm.ForeColor = System.Drawing.SystemColors.ControlText;
            this.pbAmpliarForm.IconChar = FontAwesome.Sharp.IconChar.Github;
            this.pbAmpliarForm.IconColor = System.Drawing.SystemColors.ControlText;
            this.pbAmpliarForm.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.pbAmpliarForm.IconSize = 20;
            this.pbAmpliarForm.Location = new System.Drawing.Point(1044, 636);
            this.pbAmpliarForm.Name = "pbAmpliarForm";
            this.pbAmpliarForm.Size = new System.Drawing.Size(20, 20);
            this.pbAmpliarForm.TabIndex = 1;
            this.pbAmpliarForm.TabStop = false;
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(1264, 681);
            this.Controls.Add(this.panelPrincipal);
            this.MinimumSize = new System.Drawing.Size(500, 500);
            this.Name = "Principal";
            this.Text = "Principal";
            this.Load += new System.EventHandler(this.Principal_Load);
            this.panelPrincipal.ResumeLayout(false);
            this.panelmenu.ResumeLayout(false);
            this.paneltablero.ResumeLayout(false);
            this.paneltablero.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbFotoEmpleado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbFototienda)).EndInit();
            this.panelHerramientas.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbMaximizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMinimizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbCerrar)).EndInit();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbAmpliarForm)).EndInit();
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
        private FontAwesome.Sharp.IconButton iconButton7;
        private FontAwesome.Sharp.IconButton iconButton6;
        private FontAwesome.Sharp.IconButton iconButton5;
        private FontAwesome.Sharp.IconButton iconButton4;
        private FontAwesome.Sharp.IconButton iconButton3;
        private FontAwesome.Sharp.IconButton iconButton2;
        private FontAwesome.Sharp.IconButton iconButton1;
        private System.Windows.Forms.PictureBox pbFototienda;
        private FontAwesome.Sharp.IconButton btnmenu;
        public System.Windows.Forms.Label lbltipo;
        public System.Windows.Forms.Label lblNombre;
        public System.Windows.Forms.PictureBox pbFotoEmpleado;
        public System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Panel panel1;
        private FontAwesome.Sharp.IconPictureBox pbAmpliarForm;
    }
}