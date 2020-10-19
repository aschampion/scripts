#@ File (label="Select a file", style="file") datFile

import sc.fiji.io.FIBSEM_Reader;

import ij.IJ;
import ij.ImagePlus;
import ij.process.ShortProcessor;
import ij.io.FileSaver;
import java.nio.file.Paths;

f = datFile;
FileInputStream file = new FileInputStream(f);
FIBSEM_Reader r = new FIBSEM_Reader();

header = r.parseHeader( file );

if ( header == null )
{
	IJ.log( "The file '" + f.getAbsolutePath() + "' is not a FIB-SEM raw file, the magic number does not match." );
	return;
}

file.close();
file = new FileInputStream( f );

file.skip( 1024 );


final int numChannels = header.numChannels;

// it is always unsigned short
final byte[] slice = new byte[ (int)header.xRes * (int)header.yRes * numChannels * 2 ];
file.read( slice );

final short[] shortSlice = new short[ (int)header.xRes * (int)header.yRes ];


for ( int i = 0; i < shortSlice.length; ++i )
{
	c = 0; // Only care about InLens
	
	int j = 2 * i * numChannels + 2 * c;
	int v = (slice[ j ] << 8) | (slice[j+1] & 0xFF);

	shortSlice[i] = (short)(v + 32768);
}

ip = new ShortProcessor( (int)header.xRes, (int)header.yRes, shortSlice, null );

file.close();


datInLens = new ImagePlus("datInLens", ip);
//datInLens.show();


newBaseName = datFile.getName();
splitPoint = newBaseName.lastIndexOf(".");
newBaseName = newBaseName.substring(0, splitPoint);
newBaseName += "FIJI_InLens_raw.tif";

fs = new FileSaver(datInLens)
fs.saveAsTiff(Paths.get(datFile.getParent(), newBaseName).toString());
