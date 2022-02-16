loopzip(){
zip=`find ./ -maxdepth 1 -name "*.zip"|grep -v TSR`;
while [ -n "$zip" ];
        do
                for d in `find ./ -maxdepth 1 -name "*.zip"|grep -v TSR`;
                do
                unzip -n "$d";
                rm -f "$d";
        done
        zip=`find ./ -maxdepth 1 -name "*.zip"|grep -v TSR`;
done
}

looptgz(){
tgz=`find ./ -maxdepth 1 -name "*.tgz"`;
while [ -n "$tgz" ];
        do
                for a in `find ./ -maxdepth 1 -name "*.tgz"`;
                do
                tar -xzvf "$a";
                rm -f "$a"
        done
        tgz=`find ./ -maxdepth 1 -name "*.tgz"`;
done
}

looptar(){
tar=`find ./ -maxdepth 1 -name "*.tar"`;
while [ -n "$tar" ];
        do
                for b in `find ./ -maxdepth 1 -name "*.tar"`;
                do
                tar -xvf "$b";
                rm -f "$b"
        done
        tar=`find ./ -maxdepth 1 -name "*.tar"`;
done
}

looptxz(){
txz=`find ./ -maxdepth 1 -name "*.tar.xz"`;
while [ -n "$txz" ];
        do
                for c in `find ./ -maxdepth 1 -name "*.tar.xz"`;
                do
                tar -xvJf "$c";
                rm -f "$c"
        done
        txz=`find ./ -maxdepth 1 -name "*.tar.xz"`;
done
}

main(){
echo "initiazing unleash...";
iniciator=`find ./ -maxdepth 1 \( -name "*.zip" -o -name "*.tar" -o -name "*.tgz" -o -name "*.tar.xz" \)|grep -v TSR`;
while [ -n "$iniciator" ]
        do
                loopzip;
                looptgz;
                looptar;
                looptxz;
        iniciator=`find ./ -maxdepth 1 \( -name "*.zip" -o -name "*.tar" -o -name "*.tgz" -o -name "*.tar.xz" \)|grep -v TSR`;
        done
echo "all tasks have been done..."
}

main;

