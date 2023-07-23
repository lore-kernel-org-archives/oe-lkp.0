Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013817F8
	for <oe-lkp@lists.linux.dev>; Sun, 23 Jul 2023 14:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2C1C433CA
	for <oe-lkp@lists.linux.dev>; Sun, 23 Jul 2023 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690122577;
	bh=tVk/zduuNc+5tUIoUUikBCx4yIAnioBFPk5HgzL1/zg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=orquASeqT1nmr6KRkODFsaJren7WKqGSxN9mQtrDwAjNK7W+1mPrxkUarZwKEy+3I
	 l1LlXIMA6aGE2+Aa9+hASAwHNaBIwaXxmJtC5V6pt0boyHsGE7y5kPgCzcVXB5obZd
	 j+rxhIFyB0CT5PTai+zoYXNVLcoyDeGUHZx+UIVU3AfkfgBxlvM8fLnPgECsFSgWn/
	 i/2ICFMYkGfiujet5apj7BjvnYPTl+SGOOzOZT/n4JZCpMlJ+mTN6EY/kUiUHbWB0t
	 cwA2x8xtCZAORq6bXGnGhm4jkFxlqtxldKzoFAXKDWrVjE9cvenOtU1WkrWeivRGD3
	 HQ/SSgThpqpBg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso5153348e87.1
        for <oe-lkp@lists.linux.dev>; Sun, 23 Jul 2023 07:29:37 -0700 (PDT)
X-Gm-Message-State: ABy/qLaPuN6DxYFC4EwxgvmheZCEfVEwFBUDe45KFyJxVvYG/y49BAOg
	vzjUdykiywI3IPBVsIhnJyfGJqznHZKoQUQsODg=
X-Google-Smtp-Source: APBJJlFoLSNRhC8Vxo4J/pS3nK8sQ+8ycVnEtStx4+N5p0VhyOq+lljxjKFaDUqKR5PlVhWmbuaQw8dujTnry7h+WwQ=
X-Received: by 2002:ac2:5624:0:b0:4fb:89f2:594c with SMTP id
 b4-20020ac25624000000b004fb89f2594cmr3538885lff.56.1690122575340; Sun, 23 Jul
 2023 07:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020>
In-Reply-To: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 23 Jul 2023 16:29:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
Message-ID: <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(cc Kirill)

On Sat, 22 Jul 2023 at 16:20, kernel test robot <oliver.sang@intel.com> wro=
te:
>
>
>
> Hello,
>
> kernel test robot noticed a kexec issue with this commit:
>
> commit: 4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a ("x86/decompressor: Avoi=
d the need for a stack in the 32-bit trampoline")
> git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-=
cleanup-v6
>
> test machine: Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ick Lake)
>
> if the kexec target kernel is with this commit, the kexec will fail.
> but if the target kernel is with the parent of this commit, the kexec has=
 no
> problem.
>
> if you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
>
> below are some logs we catpured from machine serial:
>
> >>>> while in v6.5-rc1 kernel, we wget kernel image for 4cd5b5012c
>
> [  583.891936][ T1491] /usr/bin/wget -q --timeout=3D3600 --tries=3D1 --lo=
cal-encoding=3DUTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-rh=
el-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc1-00=
010-g4cd5b5012cce -N -P /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/4c=
d5b5012cce11b2e66b3e4b927b3f30c05c4d0a
> ...
> [  586.421781][ T1491] /usr/bin/wget -q --timeout=3D3600 --tries=3D1 --lo=
cal-encoding=3DUTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-rh=
el-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/modules.cgz -N -P /o=
pt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b=
3f30c05c4d0a
> [  586.421793][ T1491]
> [  590.795340][ T1493] 592936 blocks
> [  590.795353][ T1493]
> [  590.985102][ T1491] /usr/bin/wget -q --timeout=3D3600 --tries=3D1 --lo=
cal-encoding=3DUTF-8 http://internal-lkp-server:80/~lkp/osimage/ucode/intel=
-ucode-20230406.cgz -N -P /opt/rootfs/tmp/osimage/ucode
> [  590.985117][ T1491]
> [  591.072220][ T1491] /opt/rootfs/tmp/osimage/ucode/intel-ucode-20230406=
.cgz isn't modified
> [  591.072234][ T1491]
> [  591.893130][ T1491] LKP: kexec loading... acpi_rsdp: 0x69ffd014
>
> >>>> then kexec
>
> [  591.893144][ T1491]
> [  591.907051][ T1491] kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_64-=
rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc1-=
00010-g4cd5b5012cce --initrd=3D/opt/rootfs/tmp/initrd-concatenated
> [  591.907063][ T1491]

This is the kexec load right?

> [  594.660319][ T1491] --append=3Dip=3D::::lkp-icl-2sp5::dhcp root=3D/dev=
/ram0 RESULT_ROOT=3D/result/boot/1/lkp-icl-2sp5/debian-11.1-x86_64-20220510=
.cgz/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/0 BOOT=
_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30=
c05c4d0a/vmlinuz-6.5.0-rc1-00010-g4cd5b5012cce branch=3Dardb/x86-efistub-cl=
eanup-v6 job=3D/lkp/jobs/scheduled/lkp-icl-2sp5/boot-1-debian-11.1-x86_64-2=
0220510.cgz-4cd5b5012cce-20230714-61744-1x1amw7-0.yaml user=3Dlkp ARCH=3Dx8=
6_64 kconfig=3Dx86_64-rhel-8.3 commit=3D4cd5b5012cce11b2e66b3e4b927b3f30c05=
c4d0a nmi_watchdog=3D0 acpi_rsdp=3D0x69ffd014 max_uptime=3D600 LKP_SERVER=
=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=3Ddebug sysrq_always_=
enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=
=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic loa=
d_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3De=
rr ignor
> [  594.660335][ T1491]
> LKP: rebooting by exec

And the kexec exec is issued here?

That command line seems to be truncated. Could you try doing the kexec
with earlyprintk just like the original kernel? That way, we may get
some more context on what is going on.


> [  596.812805][ T8290] intel_rapl_msr intel_rapl_msr.0: shutdown
> [  596.832306][ T8290] platform coretemp.1: shutdown
> [  596.840097][ T8290] platform coretemp.0: shutdown
> [  596.847790][ T8290] sd 3:0:0:0: shutdown
> [  596.854858][ T8290] sd 3:0:0:0: [sdb] Synchronizing SCSI cache
> [  596.864259][ T8290] sd 2:0:0:0: shutdown
> [  596.870699][ T8290] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
> [  596.879227][ T8290] sd 1:0:0:0: shutdown
> [  596.886046][ T8290] sd 1:0:0:0: [sda] Synchronizing SCSI cache
> [  596.895425][ T8290] sd 0:0:0:0: shutdown
> [  596.902234][ T8290] sd 0:0:0:0: [sdd] Synchronizing SCSI cache

<snip 400 lines of irrelevant output>

> [  599.298932][ T8290] kexec_core: Starting new kernel
> 3h@^@3harly console in extract_kernel
>
> <<<< however, just nothing after this "Starting new kernel",
> and our test machine just auto-reboot as below >>>>
>
> input_data: 0x000000207f2192dd
> input_len: 0x0000000000c0e1e2
> output: 0x000000207d000000
> output_len: 0x0000000002dd9224
> kernel_total_size: 0x0000000002c30000
> needed_size: 0x0000000002e00000
> trampoline_32bit: 0x000000000009d000
>
>
> KASLR disabled: 'nokaslr' on cmdline.
>
>
> Decompressing Linux... Parsing ELF... No relocation needed... done.
> Booting the kernel (entry_offset: 0x0000000000000000).
>
>
>
> sorry, maybe above information is not sufficient, but we cannot capture
> further information from serial.

As I suggested above, can you please try with earlyprintk for the kexec ker=
nel?

I have tried to reproduce this in QEMU, using both emulation and KVM,
and everything works fine for me. My host CPU does not have 5 level
paging, but i tried QEMU emulation with LA57 enabled.

As for the change itself: the only difference that stands out at
something that might trigger this behavior is the removal of the DS/SS
segment register assignments. Kirill: any thoughts?

One thing that would definitely help narrow this down (if the CPU in
question implements LA57 support) is to build both kernels with
CONFIG_X86_5LEVEL disabled, and to see if the behavior is different.

Thanks,






> we tried more times and we cannot kexec into this kernel each time,
> while if we use parent commit as kexec target, the kexec can boot into
> the kernel sucessfully each time.
>
> we are not sure if the config to build this kernel has some problem (when
> we test kernel with parent commit, we also use this config), so attached =
FYI.
> we are not sure if the config for above v6.5-rc1 kernel has any problem
> either, so attached FYI also.
>
> actually we want to consult, if any specific config or other requirement =
after
> this commit?
>
