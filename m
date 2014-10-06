Content-Type: multipart/mixed; boundary="===============8864044671821500176=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86LKP] PANIC: double fault, error_code: 0xffffffffffffffff
Date: Mon, 06 Oct 2014 12:39:41 -0700
Message-ID: <5432EFFD.6090201@amacapital.net>
In-Reply-To: <20141005063802.GE3264@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8864044671821500176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/04/2014 11:38 PM, Andi Kleen wrote:
>> [    5.087621] Freeing unused kernel memory: 1248K (ffff8800014c8000 - f=
fff880001600000)
>> [    5.136856] Freeing unused kernel memory: 1936K (ffff88000181c000 - f=
fff880001a00000)
>> [    5.167951] random: init urandom read with 5 bits of entropy available
>> [   19.307116] PANIC: double fault, error_code: 0xffffffffffffffff
>> [   19.309941] Kernel panic - not syncing: Machine halted.
> =

> That's odd. I actually tested it in KVM.
> =

> Will try with your config.

In case it helps, Fengguang's bot seems to use rather old userspace
code.  It's entirely possible that it's doing something different with
arch_prctl than your userspace, causing gs or gsbase to behave differently.

--Andy

> =

>> kvm=3D(
>> 	qemu-system-x86_64
>> 	-cpu kvm64
>> 	-enable-kvm
>> 	-kernel $kernel
>> 	-initrd $initrd
>> 	-m 320
>> 	-smp 2
>> 	-net nic,vlan=3D1,model=3De1000
>> 	-net user,vlan=3D1
>> 	-boot order=3Dnc
>> 	-no-reboot
>> 	-watchdog i6300esb
>> 	-rtc base=3Dlocaltime
>> 	-serial stdio
>> 	-display none
>> 	-monitor null =

>> )
> =

> -Andi
> =



--===============8864044671821500176==--

