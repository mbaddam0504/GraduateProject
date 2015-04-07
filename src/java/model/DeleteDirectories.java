/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;

/**
 *
 * @author s519295
 */
public class DeleteDirectories {
    public static boolean deleteDirectory(File dir){
        if(! dir.exists() || !dir.isDirectory())    {
        return false;
    }

    String[] files = dir.list();
    for(int i = 0, len = files.length; i < len; i++)    {
        File f = new File(dir, files[i]);
        if(f.isDirectory()) {
            deleteDirectory(f);
        }else   {
            f.delete();
        }
    }
    return dir.delete();
    }
    
}
