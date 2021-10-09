package org.reins;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

class ImagePanel extends JPanel {

    private BufferedImage image;

    public ImagePanel(File file) {
        try {
            image = ImageIO.read(file);
        } catch (IOException ex) {
            // handle exception...
        }
    }

    @Override
    public void paintComponent(Graphics g) {
        g.drawImage(image, 0, 0, null);
    }

}
