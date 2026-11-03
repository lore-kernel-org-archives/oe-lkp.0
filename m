Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667506;
	b=CepzmoTZBmvZC/PwhIi+781iG7WlVewKpNb8dXypKzr/G8d9dUseuko/6Ix5hCyAVUAL
	 +NU4VUMZdIJv0WrPMOJJUmYdVV7+hzyczJ+JJxHLMsWU7olrN5dXx/DyF8S5rOROi9Kdo
	 41sKuhVXo9ZDzf8OefCo25hAYufJzh7zkOcHoVLNfeBgvKMMGVOfFCQ+8MLbIyTaUg0zS
	 1grMTM5nkLOMEduJ8JZumIHcCu5Q+T/LYemOLOWUBzcGWrwgsqevAjy+02pwBWu+qNLFi
	 nAr9h/0DyX7cZr1E2xZbhnHHEQijjKSPAfFF5p3P9E7HMCRjva4UYx6fWclFeqDqf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667506;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=sIYbSw3W8nAa477Tus4X1jVHWb07BT37U/Yy9DhTMvo=;
	b=ZaBKSs4UmhmxM33Buf4gosW4wGbSMnXOOKD4o0BtZtyPetrCmTQ//TdYdkcwFDrPojYf
	 hzyCrpLAmHWryw0am7fAOkvqqF2JlwjqMMzQHtNu4HjtXb/ym63qNe7sSXIVrzlARhNmp
	 jo08IC/Kwah9qB36olwcKz5sAxA7xQZZmi8GPC/YD+mT6eOIX9yhlLt77Ns/jwEzjMdzv
	 QNyS8qLVS3TL0fokhuAAWJqNr5Gf0M7UETuiL5SRRxbLijtOEx2ftvDFf1XBLXEJ9C2tp
	 PxvGbRPOPKzhmwP8YumEyg6pt5rgGweEN7woGAM4ogi6fGfvoD4A6X9wSQjmwIQzpKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALARzZqi;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89A606A327
	for <oe-lkp@lists.linux.dev>; Tue,  3 Nov 2026 00:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D89A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALARzZqi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793667500; x=1825203500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMtYGLouTlTuAqWe+3zFi4u4Vl8Px7aT8IwwxZZdKe0=;
  b=ALARzZqik7UHxPXRMas0mCUpNVvQkCcwfg8ekDlqa3UBaZMXP46GdkrD
   VBmTV867mwFH5w0NX1XnnQuINouMwTOSNLiIHbDSxUBsPP433SWcbydwW
   xpOHZKVMBHhTSntgdVhneSY3BgSX+ymiiFYZtSb20CqgtashcTWONtaK6
   UoO2YUqaVzSV3Svs9n1qt9WaA2cjt0SKsnxnouLZr/ccZY97hg9/WsK2S
   Osz0ULpkIvXRftQrdjIW/Rwh68XMM14ZmHPGu44Bz/p/PgofaUZ8BRPwe
   MOcsY1rBjC7YWeTent/EtDhNwleQbPXfqH/bLZPDvIkv1+9rRRsjEmIzc
   w==;
X-CSE-ConnectionGUID: d3mXyglMTlK8MRC5YVBJXw==
X-CSE-MsgGUID: wmeb1EWZQvWoHKCIQFl5lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2257379"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2257379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 16:58:19 -0800
X-CSE-ConnectionGUID: Uk9R0ufYTC2djkTEprG3nA==
X-CSE-MsgGUID: SUfnOj1cR+eINHJPpTXmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6435468"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 16:58:11 -0800
Date: Tue, 3 Nov 2026 08:58:07 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Borkman <daniel@iogearbox.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Gary Guo <gary@garyguo.net>,
	Guo Ren <guoren@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>, KP Singh <kpsingh@kernel.org>,
	Marc Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Rich Felker <dalias@libc.org>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Will Deacon <will@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, yi1.lai@intel.com
Subject: [linus:master] [atomic]  80047d84ee:
 WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked
Message-ID: <202611022259.def3e086-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:at_include/linux/instrumented.h:#__split_huge_pmd_locked" on:

commit: 80047d84eed25e9c92cfb9169980a0dfec110246 ("atomic: add alignment check to instrumented atomic operations") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]

in testcase: trinity
with following parameters:

	runtime: 300s
	group: group-02
	nr_groups: 5


config: i386-randconfig-1005-20261101
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu Icelake-Server-noTSX,enforce,lm=off -smp 4 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611022259.def3e086-lkp@intel.com


[   18.704659][ T3738] ------------[ cut here ]------------
[   18.706815][ T3738] WARNING: include/linux/instrumented.h:62 at __split_huge_pmd_locked+0x6d2/0xac0, CPU#0: trinity-c1/3738
[   18.717796][ T3738] Modules linked in:
[   18.719286][ T3738] CPU: 0 UID: 65534 PID: 3738 Comm: trinity-c1 Not tainted 6.19.0-rc6-00100-g80047d84eed2 #1 PREEMPT(lazy)
[   18.723193][ T3738] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   18.726644][ T3738] EIP: __split_huge_pmd_locked (x86/include/asm/pgtable.h:228 (discriminator 1) huge_memory.c:3128 (discriminator 1))
[   18.728717][ T3738] Code: dc 85 d2 75 0c c6 45 c2 00 85 c0 0f 84 ee fe ff ff f6 45 bc 03 0f 85 47 03 00 00 8b 45 bc 80 08 10 c6 45 c2 01 e9 d5 fe ff ff <0f> 0b 0f c7 4d ec 0f 84 34 fd ff ff eb f2 e8 db 58 40 01 85 c0 0f
All code
========
   0:	dc 85 d2 75 0c c6    	faddl  -0x39f38a2e(%rbp)
   6:	45 c2 00 85          	rex.RB ret $0x8500
   a:	c0 0f 84             	rorb   $0x84,(%rdi)
   d:	ee                   	out    %al,(%dx)
   e:	fe                   	(bad)
   f:	ff                   	(bad)
  10:	ff f6                	push   %rsi
  12:	45 bc 03 0f 85 47    	rex.RB mov $0x47850f03,%r12d
  18:	03 00                	add    (%rax),%eax
  1a:	00 8b 45 bc 80 08    	add    %cl,0x880bc45(%rbx)
  20:	10 c6                	adc    %al,%dh
  22:	45 c2 01 e9          	rex.RB ret $0xe901
  26:	d5 fe ff ff          	{rex2 0xfe} ud0 %r23,%r31
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	0f c7 4d ec          	cmpxchg8b -0x14(%rbp)
  30:	0f 84 34 fd ff ff    	je     0xfffffffffffffd6a
  36:	eb f2                	jmp    0x2a
  38:	e8 db 58 40 01       	call   0x1405918
  3d:	85 c0                	test   %eax,%eax
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction ===========================================
   0:	0f 0b                	ud2
   2:	0f c7 4d ec          	cmpxchg8b -0x14(%rbp)
   6:	0f 84 34 fd ff ff    	je     0xfffffffffffffd40
   c:	eb f2                	jmp    0x0
   e:	e8 db 58 40 01       	call   0x14058ee
  13:	85 c0                	test   %eax,%eax
  15:	0f                   	.byte 0xf
[   18.738340][ T3738] EAX: 00000000 EBX: 04507067 ECX: 00000000 EDX: 00000000
[   18.740746][ T3738] ESI: 00000000 EDI: 04507067 EBP: 44669d30 ESP: 44669cd8
[   18.743073][ T3738] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010202
[   18.745603][ T3738] CR0: 80050033 CR2: 00000004 CR3: 042e6000 CR4: 00350ef0
[   18.747953][ T3738] DR0: 3678f000 DR1: 36ba2000 DR2: 00000000 DR3: 00000000
[   18.753554][ T3738] DR6: ffff0ff0 DR7: 00070602
[   18.755107][ T3738] Call Trace:
[   18.756252][ T3738]  ? split_huge_pmd_address (huge_memory.c:3270 huge_memory.c:3284 huge_memory.c:3297)
[   18.758035][ T3738]  ? vma_adjust_trans_huge (huge_memory.c:3309 huge_memory.c:3321)
[   18.759892][ T3738]  ? __split_vma (vma.c:554)
[   18.761489][ T3738]  ? vma_modify (vma.c:596 vma.c:1674)
[   18.762981][ T3738]  ? vma_modify_flags (vma.c:1694)
[   18.764670][ T3738]  ? madvise_vma_behavior (madvise.c:169 madvise.c:1441)
[   18.765920][ T3738]  ? madvise_do_behavior (madvise.c:1721 madvise.c:1937)
[   18.767061][ T3738]  ? do_madvise (madvise.c:2030)
[   18.768042][ T3738]  ? __ia32_sys_madvise (madvise.c:2039 (discriminator 1) madvise.c:2037 (discriminator 1) madvise.c:2037 (discriminator 1))
[   18.769149][ T3738]  ? ia32_sys_call (kbuild/obj/consumer/i386-randconfig-1005-20261101/./arch/x86/include/generated/asm/syscalls_32.h:220)
[   18.770238][ T3738]  ? do_int80_syscall_32 (x86/entry/syscall_32.c:83 x86/entry/syscall_32.c:259)
[   18.771374][ T3738]  ? entry_INT80_32 (x86/entry/entry_32.S:940)
[   18.772429][ T3738] irq event stamp: 781495
[   18.773388][ T3738] hardirqs last  enabled at (781509): __up_console_sem (printk/printk.c:345 (discriminator 1))
[   18.775278][ T3738] hardirqs last disabled at (781522): __up_console_sem (printk/printk.c:343 (discriminator 1))
[   18.777167][ T3738] softirqs last  enabled at (781232): handle_softirqs (softirq.c:468 softirq.c:650)
[   18.779118][ T3738] softirqs last disabled at (781219): __do_softirq (softirq.c:656)
[   18.781012][ T3738] ---[ end trace 0000000000000000 ]---
[  220.112163][    T0] CE: hpet increased min_delta_ns to 5000 nsec
[  220.112245][    T0] CE: hpet increased min_delta_ns to 7500 nsec
[  220.112306][    T0] CE: hpet increased min_delta_ns to 11250 nsec
[  313.879988][  T384] sh: can't kill pid 3613: No such process
[  319.115692][    C0] CE: hpet increased min_delta_ns to 16875 nsec
LKP: ttyS0: 335: LKP: tbox cant kexec and rebooting forcely [  325.428435][  T335] sysrq: Emergency Sync
[  325.430372][   T10] Emergency Sync complete
[  325.431919][  T335] sysrq: Resetting

Kboot worker: lkp-worker71
Elapsed time: 360
Host load: peak load1 279.34, peak cpu pressure 96.63%, qemu waited 0s for a cpu in 360s, container throttled 0s, 6 samples

kvm=(
qemu-system-i386
-enable-kvm
-cpu Icelake-Server-noTSX,enforce,lm=off
-kernel $kernel
-initrd initrd-vm-meta-160.cgz
-m 4096
-smp 4
-device e1000,netdev=net0
-netdev user,id=net0,hostfwd=tcp::32032-:22
-boot order=nc
-no-reboot
-device i6300esb
-device pci-testdev
-watchdog-action debug
-rtc base=localtime
-serial stdio
-display none
-monitor null
)

append=(
ip=::::vm-meta-160::dhcp
root=/dev/ram0
RESULT_ROOT=/result/trinity/group-02-5-300s/vm-icl-i386/yocto-i386-minimal-20190520.cgz/i386-randconfig-1005-20261101/gcc-14/80047d84eed25e9c92cfb9169980a0dfec110246/0
BOOT_IMAGE=/pkg/linux/i386-randconfig-1005-20261101/gcc-14/80047d84eed25e9c92cfb9169980a0dfec110246/vmlinuz-6.19.0-rc6-00100-g80047d84eed2
branch=linux-next/master
job=/job-script
user=lkp
ARCH=i386
kconfig=i386-randconfig-1005-20261101
commit=80047d84eed25e9c92cfb9169980a0dfec110246
mem=4G
intremap=posted_msi
rcuperf.shutdown=0
rcuscale.shutdown=0
refscale.shutdown=0
audit=0
kunit.enable=0
init_on_free=0
max_uptime=3600
result_service=tmpfs
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
watchdog_thresh=55
workqueue.watchdog_thresh=140
smp.csd_lock_timeout=100000
sysctl.kernel.hung_task_timeout_secs=140
net.ifnames=0
printk.devkmsg=on
panic=30
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw
earlycon=uart8250,io,0x3f8,115200n8
keep_bootcon
)

"${kvm[@]}" -append "${append[*]}"

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611022259.def3e086-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


