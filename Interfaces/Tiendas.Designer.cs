
namespace Interfaces
{
    partial class Tiendas
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
            this.panelContenedorTiendas = new System.Windows.Forms.Panel();
            this.panelHerramientasTiendas = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lblNombreForm = new System.Windows.Forms.Label();
            this.panelContenedorTiendas.SuspendLayout();
            this.panelHerramientasTiendas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panelContenedorTiendas
            // 
            this.panelContenedorTiendas.Controls.Add(this.panelHerramientasTiendas);
            this.panelContenedorTiendas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelContenedorTiendas.Location = new System.Drawing.Point(0, 0);
            this.panelContenedorTiendas.Name = "panelContenedorTiendas";
            this.panelContenedorTiendas.Size = new System.Drawing.Size(1048, 617);
            this.panelContenedorTiendas.TabIndex = 0;
            // 
            // panelHerramientasTiendas
            // 
            this.panelHerramientasTiendas.BackColor = System.Drawing.Color.MidnightBlue;
            this.panelHerramientasTiendas.Controls.Add(this.lblNombreForm);
            this.panelHerramientasTiendas.Controls.Add(this.pictureBox1);
            this.panelHerramientasTiendas.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelHerramientasTiendas.Location = new System.Drawing.Point(0, 0);
            this.panelHerramientasTiendas.Name = "panelHerramientasTiendas";
            this.panelHerramientasTiendas.Size = new System.Drawing.Size(1048, 40);
            this.panelHerramientasTiendas.TabIndex = 0;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = global::Interfaces.Properties.Resources.tienda;
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(79, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(40, 40);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // lblNombreForm
            // 
            this.lblNombreForm.AutoSize = true;
            this.lblNombreForm.Font = new System.Drawing.Font("Century Gothic", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNombreForm.ForeColor = System.Drawing.Color.Aqua;
            this.lblNombreForm.Location = new System.Drawing.Point(149, 4);
            this.lblNombreForm.Name = "lblNombreForm";
            this.lblNombreForm.Size = new System.Drawing.Size(101, 32);
            this.lblNombreForm.TabIndex = 1;
            this.lblNombreForm.Text = "Tienda";
            // 
            // Tiendas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1048, 617);
            this.Controls.Add(this.panelContenedorTiendas);
            this.Name = "Tiendas";
            this.Text = "Tiendas";
            this.panelContenedorTiendas.ResumeLayout(false);
            this.panelHerramientasTiendas.ResumeLayout(false);
            this.panelHerramientasTiendas.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelContenedorTiendas;
        private System.Windows.Forms.Panel panelHerramientasTiendas;
        private System.Windows.Forms.Label lblNombreForm;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}