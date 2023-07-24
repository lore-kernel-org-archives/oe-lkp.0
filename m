Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF86FC5
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 13:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A41AC433CA
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690203854;
	bh=pOvLPVqvJK9KS4b7zuqhywzx0T9v3j0Pl53eCKMU7Fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jaOiW2dcl5H2t6wc5xbXkU80irOyictiMtv16wUtX108y64Yi63eX9DARbZ5Xg91t
	 Gsm7/ITU05m3C2S3jrLh/WA6YANxR8dC1ImwtuKwNfwdnhi8ND0svFVW92w299xSkB
	 cWYLZeppaqfGxj21jfwTc6UzmWl3DaPIpzwMRmgaZtug0kR0Da+hJ8eijt544cVOK3
	 QLaOuA1qR72I3acL49FCbp9w+XWxEZlrHeZK85HnAlJ5ILdc0rWGYHlslLr6dL++DZ
	 0ugYpO5ZHTOC4YnpS4EZUVB0p7kD+5B0H2Ug4Dka9v734b4zxjwLgay4fn/DZpZfVZ
	 kBTbmsQ1Tvvew==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso6280835e87.3
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 06:04:13 -0700 (PDT)
X-Gm-Message-State: ABy/qLY1va2D+EdN5fXYHoBr37oXDym/uWICNVDCPUc7ftiQSU0i5PTh
	+RfpdT1Z3LrRmyv0Q/W943BKHHipnq7u420OpzE=
X-Google-Smtp-Source: APBJJlHvg56AV4gcmm5+10d0Ogk3NzBrTmxsH7hHHN7QewEeDtgza/8eNSl/jE9bTx6ih2tBzxvYRTcg7tMKje+u/iw=
X-Received: by 2002:a05:6512:3142:b0:4fb:8f81:4fe8 with SMTP id
 s2-20020a056512314200b004fb8f814fe8mr4518796lfi.46.1690203852011; Mon, 24 Jul
 2023 06:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020> <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGTdkN0j9W6HvjXi86jnsJF011sTzUsknwfs7PWccmQRQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 Jul 2023 15:04:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com>
Message-ID: <CAMj1kXEVhRAeqDTwETW3KZ5TVwiRNbXSDAcED=XfvXjEs=DPuA@mail.gmail.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Jul 2023 at 16:29, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> (cc Kirill)
>
> On Sat, 22 Jul 2023 at 16:20, kernel test robot <oliver.sang@intel.com> w=
rote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a kexec issue with this commit:
> >
> > commit: 4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a ("x86/decompressor: Av=
oid the need for a stack in the 32-bit trampoline")
> > git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistu=
b-cleanup-v6
> >
> > test machine: Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ick Lake)
> >
> > if the kexec target kernel is with this commit, the kexec will fail.
> > but if the target kernel is with the parent of this commit, the kexec h=
as no
> > problem.
> >
> > if you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> > below are some logs we catpured from machine serial:
> >
> > >>>> while in v6.5-rc1 kernel, we wget kernel image for 4cd5b5012c
> >
> > [  583.891936][ T1491] /usr/bin/wget -q --timeout=3D3600 --tries=3D1 --=
local-encoding=3DUTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-=
rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc1-=
00010-g4cd5b5012cce -N -P /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/=
4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a
> > ...
> > [  586.421781][ T1491] /usr/bin/wget -q --timeout=3D3600 --tries=3D1 --=
local-encoding=3DUTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-=
rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/modules.cgz -N -P =
/opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b92=
7b3f30c05c4d0a
> > [  586.421793][ T1491]
> > [  590.795340][ T1493] 592936 blocks
> > [  590.795353][ T1493]
> > [  590.985102][ T1491] /usr/bin/wget -q --timeout=3D3600 --tries=3D1 --=
local-encoding=3DUTF-8 http://internal-lkp-server:80/~lkp/osimage/ucode/int=
el-ucode-20230406.cgz -N -P /opt/rootfs/tmp/osimage/ucode
> > [  590.985117][ T1491]
> > [  591.072220][ T1491] /opt/rootfs/tmp/osimage/ucode/intel-ucode-202304=
06.cgz isn't modified
> > [  591.072234][ T1491]
> > [  591.893130][ T1491] LKP: kexec loading... acpi_rsdp: 0x69ffd014
> >
> > >>>> then kexec
> >
> > [  591.893144][ T1491]
> > [  591.907051][ T1491] kexec --noefi -l /opt/rootfs/tmp/pkg/linux/x86_6=
4-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/vmlinuz-6.5.0-rc=
1-00010-g4cd5b5012cce --initrd=3D/opt/rootfs/tmp/initrd-concatenated
> > [  591.907063][ T1491]
>
> This is the kexec load right?
>
> > [  594.660319][ T1491] --append=3Dip=3D::::lkp-icl-2sp5::dhcp root=3D/d=
ev/ram0 RESULT_ROOT=3D/result/boot/1/lkp-icl-2sp5/debian-11.1-x86_64-202205=
10.cgz/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f30c05c4d0a/0 BO=
OT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-12/4cd5b5012cce11b2e66b3e4b927b3f=
30c05c4d0a/vmlinuz-6.5.0-rc1-00010-g4cd5b5012cce branch=3Dardb/x86-efistub-=
cleanup-v6 job=3D/lkp/jobs/scheduled/lkp-icl-2sp5/boot-1-debian-11.1-x86_64=
-20220510.cgz-4cd5b5012cce-20230714-61744-1x1amw7-0.yaml user=3Dlkp ARCH=3D=
x86_64 kconfig=3Dx86_64-rhel-8.3 commit=3D4cd5b5012cce11b2e66b3e4b927b3f30c=
05c4d0a nmi_watchdog=3D0 acpi_rsdp=3D0x69ffd014 max_uptime=3D600 LKP_SERVER=
=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=3Ddebug sysrq_always_=
enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=
=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic loa=
d_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3De=
rr ignor
> > [  594.660335][ T1491]
> > LKP: rebooting by exec
>
> And the kexec exec is issued here?
>
> That command line seems to be truncated. Could you try doing the kexec
> with earlyprintk just like the original kernel? That way, we may get
> some more context on what is going on.
>
>
> > [  596.812805][ T8290] intel_rapl_msr intel_rapl_msr.0: shutdown
> > [  596.832306][ T8290] platform coretemp.1: shutdown
> > [  596.840097][ T8290] platform coretemp.0: shutdown
> > [  596.847790][ T8290] sd 3:0:0:0: shutdown
> > [  596.854858][ T8290] sd 3:0:0:0: [sdb] Synchronizing SCSI cache
> > [  596.864259][ T8290] sd 2:0:0:0: shutdown
> > [  596.870699][ T8290] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
> > [  596.879227][ T8290] sd 1:0:0:0: shutdown
> > [  596.886046][ T8290] sd 1:0:0:0: [sda] Synchronizing SCSI cache
> > [  596.895425][ T8290] sd 0:0:0:0: shutdown
> > [  596.902234][ T8290] sd 0:0:0:0: [sdd] Synchronizing SCSI cache
>
> <snip 400 lines of irrelevant output>
>
> > [  599.298932][ T8290] kexec_core: Starting new kernel
> > 3h@^@3harly console in extract_kernel
> >
> > <<<< however, just nothing after this "Starting new kernel",
> > and our test machine just auto-reboot as below >>>>
> >
> > input_data: 0x000000207f2192dd
> > input_len: 0x0000000000c0e1e2
> > output: 0x000000207d000000
> > output_len: 0x0000000002dd9224
> > kernel_total_size: 0x0000000002c30000
> > needed_size: 0x0000000002e00000
> > trampoline_32bit: 0x000000000009d000
> >
> >
> > KASLR disabled: 'nokaslr' on cmdline.
> >
> >
> > Decompressing Linux... Parsing ELF... No relocation needed... done.
> > Booting the kernel (entry_offset: 0x0000000000000000).
> >
> >
> >
> > sorry, maybe above information is not sufficient, but we cannot capture
> > further information from serial.
>
> As I suggested above, can you please try with earlyprintk for the kexec k=
ernel?
>
> I have tried to reproduce this in QEMU, using both emulation and KVM,
> and everything works fine for me. My host CPU does not have 5 level
> paging, but i tried QEMU emulation with LA57 enabled.
>
> As for the change itself: the only difference that stands out at
> something that might trigger this behavior is the removal of the DS/SS
> segment register assignments. Kirill: any thoughts?
>
> One thing that would definitely help narrow this down (if the CPU in
> question implements LA57 support) is to build both kernels with
> CONFIG_X86_5LEVEL disabled, and to see if the behavior is different.
>

I have prepared an alternative branch here

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=3Dx86=
-efistub-cleanup-v6a

that has the exact same changes, but split into more patches, so it
should be easier to narrow down which change triggers the regression.

Could you please run the same test using this branch? Thanks.
