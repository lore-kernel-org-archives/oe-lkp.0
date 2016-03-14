Content-Type: multipart/mixed; boundary="===============0432704185097604533=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [namei] fda89e6574: kernel BUG at fs/namei.c:679!
Date: Mon, 14 Mar 2016 13:30:45 +0800
Message-ID: <87mvq18w3e.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160314031001.GY17997@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0432704185097604533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Al Viro <viro@ZenIV.linux.org.uk> writes:

> On Mon, Mar 14, 2016 at 08:48:26AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.lookups
>> commit fda89e65743179d09e55bc6c265d06fa5efa8803 ("namei: untanlge lookup=
_fast()")
>
> Unfortunately, while with my normal .config it reliably triggers an oops
> in x86_pmu_enable() (with or without those patches), yours triggers nothi=
ng
> but a pile of OOMs.  How much RAM do you give those suckers?  I'm _not_
> testing those on bare hardware, obviously - it's KVM image.

qemu-system-x86_64 -enable-kvm -cpu qemu64,+ssse3 -kernel /pkg/linux/x86_64=
-rhel/gcc-4.9/fda89e65743179d09e55bc6c265d06fa5efa8803/vmlinuz-4.5.0-rc4-00=
017-gfda89e6 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-k=
build-4G-3/bisect_trinity-300s-debian-x86_64-2015-02-07.cgz-x86_64-rhel-fda=
89e65743179d09e55bc6c265d06fa5efa8803-20160312-104797-ow7uw0-0.yaml ARCH=3D=
x86_64 kconfig=3Dx86_64-rhel branch=3Dlinux-devel/devel-catchup-20160312025=
7 commit=3Dfda89e65743179d09e55bc6c265d06fa5efa8803 BOOT_IMAGE=3D/pkg/linux=
/x86_64-rhel/gcc-4.9/fda89e65743179d09e55bc6c265d06fa5efa8803/vmlinuz-4.5.0=
-rc4-00017-gfda89e6 max_uptime=3D1500 RESULT_ROOT=3D/result/trinity/300s/vm=
-kbuild-4G/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/fda89e65743179d=
09e55bc6c265d06fa5efa8803/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 sys=
temd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_c=
pu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic=
 oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 co=
nsole=3Dtty0 vga=3Dnormal rw ip=3D::::vm-kbuild-4G-3::dhcp'  -initrd /fs/sd=
g1/initrd-vm-kbuild-4G-3 -m 4096 -smp 4 -device e1000,netdev=3Dnet0 -netdev=
 user,id=3Dnet0,hostfwd=3Dtcp::23034-:22 -boot order=3Dnc -no-reboot -watch=
dog i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sdg1/disk0-vm-kbuild-4=
G-3,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdg1/disk1-vm-kbuild-4G-3,me=
dia=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdg1/disk2-vm-kbuild-4G-3,media=3D=
disk,if=3Dvirtio -drive file=3D/fs/sdg1/disk3-vm-kbuild-4G-3,media=3Ddisk,i=
f=3Dvirtio -drive file=3D/fs/sdg1/disk4-vm-kbuild-4G-3,media=3Ddisk,if=3Dvi=
rtio -drive file=3D/fs/sdg1/disk5-vm-kbuild-4G-3,media=3Ddisk,if=3Dvirtio -=
drive file=3D/fs/sdg1/disk6-vm-kbuild-4G-3,media=3Ddisk,if=3Dvirtio -pidfil=
e /dev/shm/kboot/pid-vm-kbuild-4G-3 -serial file:/dev/shm/kboot/serial-vm-k=
build-4G-3 -daemonize -display none -monitor null =


This is the qemu command line we used for testing.

Best Regards,
Huang, Ying

> FWIW, see below for hopefully cleaner fix (will fold once I manage to tri=
gger
> the damn thing and verify that fix indeed fixes).  It's on top of offendi=
ng
> commit.  Folks, could you please check if it fixes that crap on your setu=
p?
>
> diff --git a/fs/namei.c b/fs/namei.c
> index 7a5f79f..d721821 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -1519,6 +1519,7 @@ static int lookup_fast(struct nameidata *nd,
>  	struct vfsmount *mnt =3D nd->path.mnt;
>  	struct dentry *dentry, *parent =3D nd->path.dentry;
>  	int err;
> +	int status =3D 1;
>  =

>  	/*
>  	 * Rename seqlock is not required here because in the off chance
> @@ -1555,54 +1556,45 @@ static int lookup_fast(struct nameidata *nd,
>  			return -ECHILD;
>  =

>  		*seqp =3D seq;
> -		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE)) {
> -			int status =3D d_revalidate(dentry, nd->flags);
> -			if (unlikely(status <=3D 0)) {
> -				if (unlazy_walk(nd, dentry, seq))
> -					return -ECHILD;
> -				if (status =3D=3D -ECHILD)
> -					status =3D d_revalidate(dentry, nd->flags);
> -				if (status <=3D 0) {
> -					if (!status) {
> -						d_invalidate(dentry);
> -						status =3D 1;
> -					}
> -					dput(dentry);
> -					return status;
> -				}
> -			}
> +		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE))
> +			status =3D d_revalidate(dentry, nd->flags);
> +		if (unlikely(status <=3D 0)) {
> +			if (unlazy_walk(nd, dentry, seq))
> +				return -ECHILD;
> +			if (status =3D=3D -ECHILD)
> +				status =3D d_revalidate(dentry, nd->flags);
> +		} else {
> +			/*
> +			 * Note: do negative dentry check after revalidation in
> +			 * case that drops it.
> +			 */
> +			if (unlikely(negative))
> +				return -ENOENT;
> +			path->mnt =3D mnt;
> +			path->dentry =3D dentry;
> +			if (likely(__follow_mount_rcu(nd, path, inode, seqp)))
> +				return 0;
> +			if (unlazy_walk(nd, dentry, seq))
> +				return -ECHILD;
>  		}
> -		/*
> -		 * Note: do negative dentry check after revalidation in
> -		 * case that drops it.
> -		 */
> -		if (unlikely(negative))
> -			return -ENOENT;
> -		path->mnt =3D mnt;
> -		path->dentry =3D dentry;
> -		if (likely(__follow_mount_rcu(nd, path, inode, seqp)))
> -			return 0;
> -		if (unlazy_walk(nd, dentry, seq))
> -			return -ECHILD;
>  	} else {
>  		dentry =3D __d_lookup(parent, &nd->last);
>  		if (unlikely(!dentry))
>  			return 1;
> -		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE)) {
> -			int status =3D d_revalidate(dentry, nd->flags);
> -			if (unlikely(status <=3D 0)) {
> -				if (!status) {
> -					d_invalidate(dentry);
> -					status =3D 1;
> -				}
> -				dput(dentry);
> -				return status;
> -			}
> -		}
> -		if (unlikely(d_is_negative(dentry))) {
> -			dput(dentry);
> -			return -ENOENT;
> +		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE))
> +			status =3D d_revalidate(dentry, nd->flags);
> +	}
> +	if (unlikely(status <=3D 0)) {
> +		if (!status) {
> +			d_invalidate(dentry);
> +			status =3D 1;
>  		}
> +		dput(dentry);
> +		return status;
> +	}
> +	if (unlikely(d_is_negative(dentry))) {
> +		dput(dentry);
> +		return -ENOENT;
>  	}
>  =

>  	path->mnt =3D mnt;
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============0432704185097604533==--

