#!/bin/sh

echo "------------------"
echo "Đang tạo Packages...."
apt-ftparchive packages ./DEB > ./Packages;
#sed -i -e '/^SHA/d' ./Packages;
bzip2 -c9k ./Packages > ./Packages.bz2;
echo "------------------"
echo "Đang tạo Release...."
printf "Origin: TQM - Mos  ™\nLabel: TQM - Mos  ™\nSuite: stable\nVersion: 1.0\nCodename: ios\nArchitectures: iphoneos-arm iphoneos-arm64\nComponents: main\nDescription: Kho Lưu Trữu Tinh Chỉnh Tốt Nhất 🤩\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;

echo "------------------"
echo "Xong !"
exit 0;