
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
            this.panelPrincipal = new System.Windows.Forms.Panel();
            this.panelHerramientas = new System.Windows.Forms.Panel();
            this.pbCerrar = new FontAwesome.Sharp.IconPictureBox();
            this.pbMinimizar = new FontAwesome.Sharp.IconPictureBox();
            this.pbMaximizar = new FontAwesome.Sharp.IconPictureBox();
            this.panelPrincipal.SuspendLayout();
            this.panelHerramientas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbCerrar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMinimizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMaximizar)).BeginInit();
            this.SuspendLayout();
            // 
            // panelPrincipal
            // 
            this.panelPrincipal.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelPrincipal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(140)))), ((int)(((byte)(246)))));
            this.panelPrincipal.Controls.Add(this.panelHerramientas);
            this.panelPrincipal.Location = new System.Drawing.Point(0, 0);
            this.panelPrincipal.Name = "panelPrincipal";
            this.panelPrincipal.Size = new System.Drawing.Size(1264, 681);
            this.panelPrincipal.TabIndex = 0;
            // 
            // panelHerramientas
            // 
            this.panelHerramientas.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(2)))), ((int)(((byte)(46)))), ((int)(((byte)(225)))));
            this.panelHerramientas.Controls.Add(this.pbMaximizar);
            this.panelHerramientas.Controls.Add(this.pbMinimizar);
            this.panelHerramientas.Controls.Add(this.pbCerrar);
            this.panelHerramientas.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelHerramientas.Location = new System.Drawing.Point(0, 0);
            this.panelHerramientas.Name = "panelHerramientas";
            this.panelHerramientas.Size = new System.Drawing.Size(1264, 25);
            this.panelHerramientas.TabIndex = 0;
            // 
            // pbCerrar
            // 
            this.pbCerrar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbCerrar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(2)))), ((int)(((byte)(46)))), ((int)(((byte)(225)))));
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
            // pbMinimizar
            // 
            this.pbMinimizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pbMinimizar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(2)))), ((int)(((byte)(46)))), ((int)(((byte)(225)))));
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
            this.pbMaximizar.Location = new System.Drawing.Point(1186, 0);
            this.pbMaximizar.Name = "pbMaximizar";
            this.pbMaximizar.Size = new System.Drawing.Size(25, 25);
            this.pbMaximizar.TabIndex = 3;
            this.pbMaximizar.TabStop = false;
            this.pbMaximizar.Click += new System.EventHandler(this.pbMaximizar_Click);
            this.pbMaximizar.MouseLeave += new System.EventHandler(this.pbMaximizar_MouseLeave);
            this.pbMaximizar.MouseHover += new System.EventHandler(this.pbMaximizar_MouseHover);
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
            this.panelHerramientas.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pbCerrar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMinimizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbMaximizar)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelPrincipal;
        private System.Windows.Forms.Panel panelHerramientas;
        private FontAwesome.Sharp.IconPictureBox pbMaximizar;
        private FontAwesome.Sharp.IconPictureBox pbMinimizar;
        private FontAwesome.Sharp.IconPictureBox pbCerrar;
    }
}