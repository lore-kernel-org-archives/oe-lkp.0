Content-Type: multipart/mixed; boundary="===============7950321395686508585=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86LKP] PANIC: double fault, error_code: 0xffffffffffffffff
Date: Sat, 04 Oct 2014 23:38:02 -0700
Message-ID: <20141005063802.GE3264@tassilo.jf.intel.com>
In-Reply-To: <20141004134729.GB5214@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7950321395686508585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> [    5.087621] Freeing unused kernel memory: 1248K (ffff8800014c8000 - ff=
ff880001600000)
> [    5.136856] Freeing unused kernel memory: 1936K (ffff88000181c000 - ff=
ff880001a00000)
> [    5.167951] random: init urandom read with 5 bits of entropy available
> [   19.307116] PANIC: double fault, error_code: 0xffffffffffffffff
> [   19.309941] Kernel panic - not syncing: Machine halted.

That's odd. I actually tested it in KVM.

Will try with your config.

> kvm=3D(
> 	qemu-system-x86_64
> 	-cpu kvm64
> 	-enable-kvm
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )

-Andi

--===============7950321395686508585==--

