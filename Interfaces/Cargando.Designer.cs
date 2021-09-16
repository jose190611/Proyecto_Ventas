
namespace Interfaces
{
    partial class Cargando
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
            this.barraCircular = new CircularProgressBar.CircularProgressBar();
            this.lblmsj1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // barraCircular
            // 
            this.barraCircular.AnimationFunction = WinFormAnimation.KnownAnimationFunctions.Liner;
            this.barraCircular.AnimationSpeed = 500;
            this.barraCircular.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(40)))), ((int)(((byte)(60)))));
            this.barraCircular.Font = new System.Drawing.Font("Century Gothic", 39.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.barraCircular.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(85)))), ((int)(((byte)(213)))), ((int)(((byte)(219)))));
            this.barraCircular.InnerColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(40)))), ((int)(((byte)(60)))));
            this.barraCircular.InnerMargin = 2;
            this.barraCircular.InnerWidth = -1;
            this.barraCircular.Location = new System.Drawing.Point(66, 30);
            this.barraCircular.MarqueeAnimationSpeed = 2000;
            this.barraCircular.Name = "barraCircular";
            this.barraCircular.OuterColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(28)))), ((int)(((byte)(43)))));
            this.barraCircular.OuterMargin = -25;
            this.barraCircular.OuterWidth = 26;
            this.barraCircular.ProgressColor = System.Drawing.Color.FromArgb(((int)(((byte)(85)))), ((int)(((byte)(213)))), ((int)(((byte)(219)))));
            this.barraCircular.ProgressWidth = 6;
            this.barraCircular.SecondaryFont = new System.Drawing.Font("Microsoft Sans Serif", 36F);
            this.barraCircular.Size = new System.Drawing.Size(150, 150);
            this.barraCircular.StartAngle = 270;
            this.barraCircular.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.barraCircular.SubscriptColor = System.Drawing.Color.FromArgb(((int)(((byte)(166)))), ((int)(((byte)(166)))), ((int)(((byte)(166)))));
            this.barraCircular.SubscriptMargin = new System.Windows.Forms.Padding(10, -35, 0, 0);
            this.barraCircular.SubscriptText = "";
            this.barraCircular.SuperscriptColor = System.Drawing.Color.FromArgb(((int)(((byte)(166)))), ((int)(((byte)(166)))), ((int)(((byte)(166)))));
            this.barraCircular.SuperscriptMargin = new System.Windows.Forms.Padding(10, 35, 0, 0);
            this.barraCircular.SuperscriptText = "";
            this.barraCircular.TabIndex = 0;
            this.barraCircular.TextMargin = new System.Windows.Forms.Padding(8, 8, 0, 0);
            this.barraCircular.Value = 68;
            // 
            // lblmsj1
            // 
            this.lblmsj1.AutoSize = true;
            this.lblmsj1.Font = new System.Drawing.Font("Century Gothic", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblmsj1.ForeColor = System.Drawing.Color.White;
            this.lblmsj1.Location = new System.Drawing.Point(69, 183);
            this.lblmsj1.Name = "lblmsj1";
            this.lblmsj1.Size = new System.Drawing.Size(147, 25);
            this.lblmsj1.TabIndex = 1;
            this.lblmsj1.Text = "Cargando. . .";
            // 
            // Cargando
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(40)))), ((int)(((byte)(60)))));
            this.ClientSize = new System.Drawing.Size(284, 211);
            this.Controls.Add(this.lblmsj1);
            this.Controls.Add(this.barraCircular);
            this.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.Name = "Cargando";
            this.Opacity = 0.85D;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cargando";
            this.Load += new System.EventHandler(this.Cargando_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private CircularProgressBar.CircularProgressBar barraCircular;
        private System.Windows.Forms.Label lblmsj1;
    }
}