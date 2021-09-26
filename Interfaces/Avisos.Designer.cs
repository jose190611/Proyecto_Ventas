
namespace Interfaces
{
    partial class Avisos
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
            this.panelContenedor = new System.Windows.Forms.Panel();
            this.btnSalir = new FontAwesome.Sharp.IconButton();
            this.btnAceptar = new FontAwesome.Sharp.IconButton();
            this.lblMensaje = new System.Windows.Forms.Label();
            this.pbIcono = new System.Windows.Forms.PictureBox();
            this.panelBarra = new System.Windows.Forms.Panel();
            this.lblBarra = new System.Windows.Forms.Label();
            this.panelContenedor.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbIcono)).BeginInit();
            this.panelBarra.SuspendLayout();
            this.SuspendLayout();
            // 
            // panelContenedor
            // 
            this.panelContenedor.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(223)))), ((int)(((byte)(230)))));
            this.panelContenedor.Controls.Add(this.btnSalir);
            this.panelContenedor.Controls.Add(this.btnAceptar);
            this.panelContenedor.Controls.Add(this.lblMensaje);
            this.panelContenedor.Controls.Add(this.pbIcono);
            this.panelContenedor.Controls.Add(this.panelBarra);
            this.panelContenedor.Cursor = System.Windows.Forms.Cursors.AppStarting;
            this.panelContenedor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelContenedor.Location = new System.Drawing.Point(0, 0);
            this.panelContenedor.Name = "panelContenedor";
            this.panelContenedor.Size = new System.Drawing.Size(334, 161);
            this.panelContenedor.TabIndex = 0;
            // 
            // btnSalir
            // 
            this.btnSalir.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSalir.FlatAppearance.BorderSize = 0;
            this.btnSalir.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Red;
            this.btnSalir.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.btnSalir.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSalir.Font = new System.Drawing.Font("Century Gothic", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSalir.IconChar = FontAwesome.Sharp.IconChar.WindowClose;
            this.btnSalir.IconColor = System.Drawing.Color.Maroon;
            this.btnSalir.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnSalir.IconSize = 30;
            this.btnSalir.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnSalir.Location = new System.Drawing.Point(240, 126);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(91, 32);
            this.btnSalir.TabIndex = 4;
            this.btnSalir.Text = "       Salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // btnAceptar
            // 
            this.btnAceptar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAceptar.FlatAppearance.BorderSize = 0;
            this.btnAceptar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Lime;
            this.btnAceptar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnAceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAceptar.Font = new System.Drawing.Font("Century Gothic", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAceptar.IconChar = FontAwesome.Sharp.IconChar.CheckCircle;
            this.btnAceptar.IconColor = System.Drawing.Color.DarkGreen;
            this.btnAceptar.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnAceptar.IconSize = 30;
            this.btnAceptar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAceptar.Location = new System.Drawing.Point(121, 126);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(91, 32);
            this.btnAceptar.TabIndex = 3;
            this.btnAceptar.Text = "          Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // lblMensaje
            // 
            this.lblMensaje.AutoSize = true;
            this.lblMensaje.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMensaje.Location = new System.Drawing.Point(117, 45);
            this.lblMensaje.Name = "lblMensaje";
            this.lblMensaje.Size = new System.Drawing.Size(53, 20);
            this.lblMensaje.TabIndex = 2;
            this.lblMensaje.Text = "label2";
            // 
            // pbIcono
            // 
            this.pbIcono.Location = new System.Drawing.Point(12, 45);
            this.pbIcono.Name = "pbIcono";
            this.pbIcono.Size = new System.Drawing.Size(80, 80);
            this.pbIcono.TabIndex = 1;
            this.pbIcono.TabStop = false;
            // 
            // panelBarra
            // 
            this.panelBarra.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(59)))), ((int)(((byte)(70)))));
            this.panelBarra.Controls.Add(this.lblBarra);
            this.panelBarra.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelBarra.Location = new System.Drawing.Point(0, 0);
            this.panelBarra.Name = "panelBarra";
            this.panelBarra.Size = new System.Drawing.Size(334, 30);
            this.panelBarra.TabIndex = 0;
            // 
            // lblBarra
            // 
            this.lblBarra.AutoSize = true;
            this.lblBarra.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBarra.Location = new System.Drawing.Point(69, 9);
            this.lblBarra.Name = "lblBarra";
            this.lblBarra.Size = new System.Drawing.Size(49, 16);
            this.lblBarra.TabIndex = 2;
            this.lblBarra.Text = "label1";
            // 
            // Avisos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(334, 161);
            this.Controls.Add(this.panelContenedor);
            this.Name = "Avisos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Avisos";
            this.panelContenedor.ResumeLayout(false);
            this.panelContenedor.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbIcono)).EndInit();
            this.panelBarra.ResumeLayout(false);
            this.panelBarra.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        public FontAwesome.Sharp.IconButton btnSalir;
        public FontAwesome.Sharp.IconButton btnAceptar;
        public System.Windows.Forms.Label lblMensaje;
        public System.Windows.Forms.PictureBox pbIcono;
        public System.Windows.Forms.Panel panelContenedor;
        public System.Windows.Forms.Panel panelBarra;
        public System.Windows.Forms.Label lblBarra;
    }
}