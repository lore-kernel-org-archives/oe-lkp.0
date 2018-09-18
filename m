Content-Type: multipart/mixed; boundary="===============7036318694978267007=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 15:54:09 +0800
Message-ID: <9df6256f-dcf3-ee6f-dd9d-b7efe2f539e6@intel.com>
In-Reply-To: <9189.1537255398@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7036318694978267007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 9/18/2018 3:23 PM, David Howells wrote:
> Still not sure what I'm meant to be seeing.  Note that there are a number=
 of
> "Not found" and "No such file or directory" errors appearing.
>
> I've attached the console log for you.
>
> David
> ---
> warthog>sudo bin/lkp qemu -k /data/fs/linux-next/build2/arch/x86/boot/bzI=
mage job-script
> make: Entering directory '/data/lkp-tests/bin/event'
> gcc    -c -o wakeup.o wakeup.c
> gcc  -static -o wakeup wakeup.o
> rm -f wakeup.o
> strip wakeup
> make: Leaving directory '/data/lkp-tests/bin/event'
> cpio: Cannot open/home/dhowells/.lkp/cache/lkp-x86_64.cpio: No such file =
or directory
> cpio: Cannot open/home/dhowells/.lkp/cache/lkp-x86_64.cpio: No such file =
or directory
> cpio: Cannot open/home/dhowells/.lkp/cache/lkp-x86_64.cpio: No such file =
or directory
> gzip:/home/dhowells/.lkp/cache/lkp-x86_64.cpio: No such file or directory
> mv: cannot stat '/home/dhowells/.lkp/cache/lkp-x86_64.cpio.gz': No such f=
ile or directory
> mv: cannot stat '/home/dhowells/.lkp/cache/lkp-x86_64.cgz': No such file =
or directory

this is not expected.
could you list/home/dhowells/.lkp/cache

looks something wrong at below function
lizhijian(a)haswell-OptiPlex-9020:~/lkp-tests$ vim lkp-exec/qemu +230
230 create_lkp_src_initrd()
231 {
232         if [[ "$kconfig" =3D~ ^(i386|x86_64)- ]]; then
233                 local arch=3D${kconfig%%-*}
234         else
235                 local arch=3D$(arch)
236         fi
237
238         if [ -d $LKP_SRC/.git ]; then
239                 local head_commit=3D$(cd $LKP_SRC && git rev-list -n1 H=
EAD)
240                 local diff_id=3D$(cd $LKP_SRC && git diff | git patch-i=
d | cut -f1 -d' ')
241                 local src_sig=3D${head_commit:0:12}_${diff_id:0:12}
242         else
243                 local src_sig=3D$(ls -lR $LKP_SRC|md5sum|cut -c1-12)
244         fi
245         lkp_initrd=3D$CACHE_DIR/lkp-$arch-$src_sig.cgz
246         [[ -f $lkp_initrd ]] || {
247                 LKP_USER=3D$user \
248                 $LKP_SRC/sbin/pack -f -a $arch lkp-src
249                 mv $CACHE_DIR/lkp-$arch.cgz $lkp_initrd
250         }
251 }


Thanks


--===============7036318694978267007==--

