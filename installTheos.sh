echo clone theos.git
cd ~
git clone git://github.com/DHowett/theos.git

echo clone iphoneheaders.git
cd ~/theos/
mv include include.bak
git clone git://github.com/rpetrich/iphoneheaders.git include
for FILE in include.bak/*.h; do mv $FILE include/; done
rmdir include.bak/

echo get IOSurfaceAPI.h
cd ~/theos/include/IOSurface/
curl -O -k https://raw.github.com/javacom/toolchain4/master/Projects/IOSurfaceAPI.h

echo clone theos-nic-templates.git
cd ~/theos/templates/
git clone git://github.com/orikad/theos-nic-templates.git

echo get dpkg-deb for Mac OS X
cd ~/theos
curl -O http://test.saurik.com/francis/dpkg-deb-fat
chmod a+x dpkg-deb-fat
sudo mkdir -p /usr/local/bin
sudo mv dpkg-deb-fat /usr/local/bin/dpkg-deb

echo get ldid for Mac OS X
cd ~/theos/bin
curl -O http://dl.dropbox.com/u/3157793/ldid
chmod a+x ldid

echo get libsubstrate.dylib substrate.h
cd ~/theos
curl -OL http://apt.saurik.com/debs/mobilesubstrate_0.9.3366-1_iphoneos-arm.deb
dpkg-deb -x mobilesubstrate_0.9.3366-1_iphoneos-arm.deb mobilesubstrate
cp mobilesubstrate/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate  ~/theos/lib/libsubstrate.dylib
cp mobilesubstrate/Library/Frameworks/CydiaSubstrate.framework/Headers/CydiaSubstrate.h include/substrate.h
