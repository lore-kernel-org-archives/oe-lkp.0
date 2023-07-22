Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242482908
	for <oe-lkp@lists.linux.dev>; Sat, 22 Jul 2023 14:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8A2C433CB
	for <oe-lkp@lists.linux.dev>; Sat, 22 Jul 2023 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690037953;
	bh=nZqz2hh9NIdV9Nk/erNTr/bOomDNnCJzFU2j/uHQKak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebHF9SB6ybR3ppuDqE8rD2TfJRRyAOL8yFC69T1MH17jDQKKrHDfNA+pZWuO1tFCh
	 wbkEfcnVIIWSgYPJCj9FuMQU46e8F/RODfqcpvD+tInRtJci5IEMeG5apo2BCEY9yC
	 RfyN1Pc8RZwvz1NsR/U9G7ttCygPfpFLXQunJE/0TiP7znTUIsl5exPJRH8EEJp8gL
	 MHxQJylccfdHuBFnBkcgFd1t6OCs6mFlPmSI6WwgZI7/toQob5eoQxqec2x2qLULKr
	 pYi8N3nv+JXEvVETK1+JqlvH9cfgLokVz7qq0UmJte6JcRtzNDDkLtpSLI4Fhgjwln
	 T22l5NFx2BZWA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso4549120e87.1
        for <oe-lkp@lists.linux.dev>; Sat, 22 Jul 2023 07:59:13 -0700 (PDT)
X-Gm-Message-State: ABy/qLbH6qZDwK9nxJNA6E+/wHnLuPKQDhIxcDlYOWXYdyQEU0GF85sG
	j9HAxfPLr+j+t1V+Wj1QaFVPXgDsm3n9+Y6ybyI=
X-Google-Smtp-Source: APBJJlFAn60B9am92aBrlS1ajsJA0wZmrM+2Fc77Pf2uTFOY0uZbLn6iLiv5+X8jyRHc8klZfMq46dQHPLHVdkM6kZ8=
X-Received: by 2002:a05:6512:1147:b0:4fb:96ed:93b3 with SMTP id
 m7-20020a056512114700b004fb96ed93b3mr2835465lfg.65.1690037951279; Sat, 22 Jul
 2023 07:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020>
In-Reply-To: <ZLvlkuJW+ooH1nCK@xsang-OptiPlex-9020>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 22 Jul 2023 16:58:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG9ZKPXJ3spvoqb+43_Y6+wwFb4FQikURWeZ9tBEVi7Fw@mail.gmail.com>
Message-ID: <CAMj1kXG9ZKPXJ3spvoqb+43_Y6+wwFb4FQikURWeZ9tBEVi7Fw@mail.gmail.com>
Subject: Re: [ardb:x86-efistub-cleanup-v6] [x86/decompressor] 4cd5b5012c:
 cannot kexec to kernel with this commit
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

Thanks for the report. Does this CPU support 5 level paging?

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
> [  596.911428][ T8290] i2c i2c-1: shutdown
> [  596.917575][ T8290] ipmi ipmi_bmc.0: shutdown
> [  596.924582][ T8290] platform microcode: shutdown
> [  596.932113][ T8290] usb 1-2-port5: shutdown
> [  596.938361][ T8290] usb 1-2-port4: shutdown
> [  596.945098][ T8290] usb 1-2-port3: shutdown
> [  596.951782][ T8290] usb 1-2-port2: shutdown
> [  596.957910][ T8290] usb 1-2-port1: shutdown
> [  596.964712][ T8290] i2c i2c-0: shutdown
> [  596.969909][ T8290] platform iTCO_wdt: shutdown
> [  596.975746][ T8290] alarmtimer alarmtimer.0.auto: shutdown
> [  596.982946][ T8290] usb usb2-port10: shutdown
> [  596.989461][ T8290] usb usb2-port9: shutdown
> [  596.995848][ T8290] usb usb2-port8: shutdown
> [  597.001450][ T8290] usb usb2-port7: shutdown
> [  597.006862][ T8290] usb usb2-port6: shutdown
> [  597.012265][ T8290] usb usb2-port5: shutdown
> [  597.017923][ T8290] usb usb2-port4: shutdown
> [  597.024084][ T8290] usb usb2-port3: shutdown
> [  597.030306][ T8290] usb usb2-port2: shutdown
> [  597.036235][ T8290] usb usb2-port1: shutdown
> [  597.041511][ T8290] usb usb1-port16: shutdown
> [  597.046823][ T8290] usb usb1-port15: shutdown
> [  597.052346][ T8290] usb usb1-port14: shutdown
> [  597.058328][ T8290] usb usb1-port13: shutdown
> [  597.064314][ T8290] usb usb1-port12: shutdown
> [  597.070201][ T8290] usb usb1-port11: shutdown
> [  597.075350][ T8290] usb usb1-port10: shutdown
> [  597.080457][ T8290] usb usb1-port9: shutdown
> [  597.085631][ T8290] usb usb1-port8: shutdown
> [  597.091123][ T8290] usb usb1-port7: shutdown
> [  597.096491][ T8290] usb usb1-port6: shutdown
> [  597.101880][ T8290] usb usb1-port5: shutdown
> [  597.106730][ T8290] usb usb1-port4: shutdown
> [  597.111518][ T8290] usb usb1-port3: shutdown
> [  597.116289][ T8290] usb usb1-port2: shutdown
> [  597.121024][ T8290] usb usb1-port1: shutdown
> [  597.125828][ T8290] platform Fixed MDIO bus.0: shutdown
> [  597.133078][ T8290] serial8250 serial8250: shutdown
> [  597.138994][ T8290] pciehp 0000:e2:05.0:pcie004: shutdown
> [  597.145010][ T8290] pcie_pme 0000:e2:05.0:pcie001: shutdown
> [  597.151047][ T8290] pciehp 0000:e2:04.0:pcie004: shutdown
> [  597.156890][ T8290] pcie_pme 0000:e2:04.0:pcie001: shutdown
> [  597.163038][ T8290] pciehp 0000:e2:03.0:pcie004: shutdown
> [  597.169306][ T8290] pcie_pme 0000:e2:03.0:pcie001: shutdown
> [  597.175791][ T8290] pciehp 0000:e2:02.0:pcie004: shutdown
> [  597.181988][ T8290] pcie_pme 0000:e2:02.0:pcie001: shutdown
> [  597.188413][ T8290] pciehp 0000:64:05.0:pcie004: shutdown
> [  597.194690][ T8290] pcie_pme 0000:64:05.0:pcie001: shutdown
> [  597.201057][ T8290] pciehp 0000:64:04.0:pcie004: shutdown
> [  597.207335][ T8290] pcie_pme 0000:64:04.0:pcie001: shutdown
> [  597.213818][ T8290] pciehp 0000:64:03.0:pcie004: shutdown
> [  597.220068][ T8290] pcie_pme 0000:64:03.0:pcie001: shutdown
> [  597.226552][ T8290] pciehp 0000:64:02.0:pcie004: shutdown
> [  597.232922][ T8290] pcie_pme 0000:64:02.0:pcie001: shutdown
> [  597.239376][ T8290] pcie_pme 0000:16:04.0:pcie001: shutdown
> [  597.245690][ T8290] pcie_pme 0000:00:1c.0:pcie001: shutdown
> [  597.252411][ T8290] platform pcspkr: shutdown
> [  597.258050][ T8290] system 00:05: shutdown
> [  597.263085][ T8290] system 00:04: shutdown
> [  597.268108][ T8290] serial 00:03: shutdown
> [  597.273150][ T8290] serial 00:02: shutdown
> [  597.278102][ T8290] system 00:01: shutdown
> [  597.283113][ T8290] rtc_cmos 00:00: shutdown
> [  597.288099][ T8290] hmem_platform hmem_platform.0: shutdown
> [  597.294618][ T8290] platform ACPI000C:00: shutdown
> [  597.300443][ T8290] platform ACPI000D:00: shutdown
> [  597.306233][ T8290] platform INTL0000:00: shutdown
> [  597.312041][ T8290] acpi-wmi PNP0C14:00: shutdown
> [  597.317530][ T8290] platform PNP0C33:00: shutdown
> [  597.323251][ T8290] pci 0000:ff:1e.7: shutdown
> [  597.328757][ T8290] pci 0000:ff:1e.6: shutdown
> [  597.334234][ T8290] pci 0000:ff:1e.5: shutdown
> [  597.339755][ T8290] pci 0000:ff:1e.4: shutdown
> [  597.345090][ T8290] pci 0000:ff:1e.3: shutdown
> [  597.350533][ T8290] pci 0000:ff:1e.2: shutdown
> [  597.355815][ T8290] pci 0000:ff:1e.1: shutdown
> [  597.361516][ T8290] pci 0000:ff:1e.0: shutdown
> [  597.367129][ T8290] pci 0000:ff:1d.1: shutdown
> [  597.372496][ T8290] pci 0000:ff:1d.0: shutdown
> [  597.377966][ T8290] pci 0000:ff:0e.7: shutdown
> [  597.383439][ T8290] pci 0000:ff:0e.6: shutdown
> [  597.388960][ T8290] pci 0000:ff:0e.5: shutdown
> [  597.394431][ T8290] pci 0000:ff:0e.4: shutdown
> [  597.399937][ T8290] pci 0000:ff:0e.3: shutdown
> [  597.405260][ T8290] pci 0000:ff:0e.2: shutdown
> [  597.410678][ T8290] pci 0000:ff:0e.1: shutdown
> [  597.415808][ T8290] pci 0000:ff:0e.0: shutdown
> [  597.421152][ T8290] pci 0000:ff:0d.7: shutdown
> [  597.426702][ T8290] pci 0000:ff:0d.6: shutdown
> [  597.432129][ T8290] pci 0000:ff:0d.5: shutdown
> [  597.437512][ T8290] pci 0000:ff:0d.4: shutdown
> [  597.442807][ T8290] pci 0000:ff:0d.3: shutdown
> [  597.448183][ T8290] pci 0000:ff:0d.2: shutdown
> [  597.453351][ T8290] pci 0000:ff:0d.1: shutdown
> [  597.458595][ T8290] pci 0000:ff:0d.0: shutdown
> [  597.463795][ T8290] pci 0000:ff:0c.7: shutdown
> [  597.469004][ T8290] pci 0000:ff:0c.6: shutdown
> [  597.474218][ T8290] pci 0000:ff:0c.5: shutdown
> [  597.479404][ T8290] pci 0000:ff:0c.4: shutdown
> [  597.484426][ T8290] pci 0000:ff:0c.3: shutdown
> [  597.489517][ T8290] pci 0000:ff:0c.2: shutdown
> [  597.494406][ T8290] pci 0000:ff:0c.1: shutdown
> [  597.499474][ T8290] pci 0000:ff:0c.0: shutdown
> [  597.504378][ T8290] pci 0000:ff:0b.7: shutdown
> [  597.509408][ T8290] pci 0000:ff:0b.6: shutdown
> [  597.514336][ T8290] pci 0000:ff:0b.5: shutdown
> [  597.519399][ T8290] pci 0000:ff:0b.4: shutdown
> [  597.524462][ T8290] pci 0000:ff:0b.3: shutdown
> [  597.529506][ T8290] pci 0000:ff:0b.2: shutdown
> [  597.534792][ T8290] pci 0000:ff:0b.1: shutdown
> [  597.539808][ T8290] pci 0000:ff:0b.0: shutdown
> [  597.544829][ T8290] pci 0000:ff:0a.7: shutdown
> [  597.549783][ T8290] pci 0000:ff:0a.6: shutdown
> [  597.554773][ T8290] pci 0000:ff:0a.5: shutdown
> [  597.560499][ T8290] pci 0000:ff:0a.4: shutdown
> [  597.565735][ T8290] pci 0000:ff:0a.3: shutdown
> [  597.570684][ T8290] pci 0000:ff:0a.2: shutdown
> [  597.575621][ T8290] pci 0000:ff:0a.1: shutdown
> [  597.580575][ T8290] pci 0000:ff:0a.0: shutdown
> [  597.585281][ T8290] pci 0000:ff:04.7: shutdown
> [  597.589948][ T8290] pci 0000:ff:04.6: shutdown
> [  597.594673][ T8290] pci 0000:ff:04.5: shutdown
> [  597.599576][ T8290] pci 0000:ff:04.4: shutdown
> [  597.604344][ T8290] pci 0000:ff:04.3: shutdown
> [  597.609240][ T8290] pci 0000:ff:04.2: shutdown
> [  597.613944][ T8290] pci 0000:ff:04.1: shutdown
> [  597.618613][ T8290] pci 0000:ff:04.0: shutdown
> [  597.623275][ T8290] pci 0000:ff:03.7: shutdown
> [  597.627991][ T8290] pci 0000:ff:03.6: shutdown
> [  597.632890][ T8290] pci 0000:ff:03.5: shutdown
> [  597.637668][ T8290] pci 0000:ff:03.4: shutdown
> [  597.642537][ T8290] pci 0000:ff:03.3: shutdown
> [  597.647264][ T8290] pci 0000:ff:03.2: shutdown
> [  597.651979][ T8290] pci 0000:ff:03.1: shutdown
> [  597.656699][ T8290] pci 0000:ff:03.0: shutdown
> [  597.661602][ T8290] pci 0000:ff:02.7: shutdown
> [  597.666379][ T8290] pci 0000:ff:02.6: shutdown
> [  597.671318][ T8290] pci 0000:ff:02.5: shutdown
> [  597.676090][ T8290] pci 0000:ff:02.4: shutdown
> [  597.680992][ T8290] pci 0000:ff:02.3: shutdown
> [  597.685728][ T8290] pci 0000:ff:02.2: shutdown
> [  597.690625][ T8290] pci 0000:ff:02.1: shutdown
> [  597.695408][ T8290] pci 0000:ff:02.0: shutdown
> [  597.700225][ T8290] pci 0000:ff:01.7: shutdown
> [  597.705084][ T8290] pci 0000:ff:01.6: shutdown
> [  597.710011][ T8290] pci 0000:ff:01.5: shutdown
> [  597.714967][ T8290] pci 0000:ff:01.4: shutdown
> [  597.719912][ T8290] pci 0000:ff:01.3: shutdown
> [  597.724835][ T8290] pci 0000:ff:01.2: shutdown
> [  597.729779][ T8290] pci 0000:ff:01.1: shutdown
> [  597.734593][ T8290] pci 0000:ff:01.0: shutdown
> [  597.739493][ T8290] pci 0000:ff:00.7: shutdown
> [  597.744269][ T8290] pci 0000:ff:00.6: shutdown
> [  597.749190][ T8290] pci 0000:ff:00.5: shutdown
> [  597.753956][ T8290] pci 0000:ff:00.4: shutdown
> [  597.759539][ T8290] pci 0000:ff:00.3: shutdown
> [  597.764667][ T8290] pci 0000:ff:00.2: shutdown
> [  597.769562][ T8290] pci 0000:ff:00.1: shutdown
> [  597.774340][ T8290] pci 0000:ff:00.0: shutdown
> [  597.779255][ T8290] pci 0000:fe:1d.0: shutdown
> [  597.784031][ T8290] pci 0000:fe:1c.0: shutdown
> [  597.788929][ T8290] pci 0000:fe:1b.0: shutdown
> [  597.793701][ T8290] pci 0000:fe:1a.0: shutdown
> [  597.798599][ T8290] icx_uncore 0000:fe:0f.0: shutdown
> [  597.804045][ T8290] icx_uncore 0000:fe:0e.0: shutdown
> [  597.809593][ T8290] icx_uncore 0000:fe:0d.0: shutdown
> [  597.815219][ T8290] icx_uncore 0000:fe:0c.0: shutdown
> [  597.820780][ T8290] pci 0000:fe:0b.2: shutdown
> [  597.825762][ T8290] pci 0000:fe:0b.1: shutdown
> [  597.830722][ T8290] pci 0000:fe:0b.0: shutdown
> [  597.835759][ T8290] pci 0000:fe:07.2: shutdown
> [  597.840730][ T8290] icx_uncore 0000:fe:07.1: shutdown
> [  597.846369][ T8290] pci 0000:fe:07.0: shutdown
> [  597.851206][ T8290] pci 0000:fe:06.2: shutdown
> [  597.856216][ T8290] icx_uncore 0000:fe:06.1: shutdown
> [  597.861853][ T8290] pci 0000:fe:06.0: shutdown
> [  597.866899][ T8290] pci 0000:fe:05.2: shutdown
> [  597.871850][ T8290] icx_uncore 0000:fe:05.1: shutdown
> [  597.877556][ T8290] pci 0000:fe:05.0: shutdown
> [  597.882654][ T8290] pci 0000:fe:04.3: shutdown
> [  597.887734][ T8290] pci 0000:fe:04.2: shutdown
> [  597.892842][ T8290] icx_uncore 0000:fe:04.1: shutdown
> [  597.898591][ T8290] pci 0000:fe:04.0: shutdown
> [  597.903729][ T8290] pci 0000:fe:03.2: shutdown
> [  597.908737][ T8290] icx_uncore 0000:fe:03.1: shutdown
> [  597.914470][ T8290] pci 0000:fe:03.0: shutdown
> [  597.919562][ T8290] pci 0000:fe:02.2: shutdown
> [  597.924729][ T8290] icx_uncore 0000:fe:02.1: shutdown
> [  597.930582][ T8290] pci 0000:fe:02.0: shutdown
> [  597.935797][ T8290] pci 0000:fe:00.5: shutdown
> [  597.941047][ T8290] pci 0000:fe:00.3: shutdown
> [  597.946270][ T8290] pci 0000:fe:00.2: shutdown
> [  597.951541][ T8290] pci 0000:fe:00.1: shutdown
> [  597.956622][ T8290] pci 0000:fe:00.0: shutdown
> [  597.961834][ T8290] pcieport 0000:e2:05.0: shutdown
> [  597.969141][ T8290] pcieport 0000:e2:04.0: shutdown
> [  597.977143][ T8290] pcieport 0000:e2:03.0: shutdown
> [  597.987033][ T8290] pcieport 0000:e2:02.0: shutdown
> [  597.996723][ T8290] pci 0000:e2:00.4: shutdown
> [  598.003626][ T8290] pci 0000:e2:00.2: shutdown
> [  598.009433][ T8290] pci 0000:e2:00.1: shutdown
> [  598.015926][ T8290] pci 0000:e2:00.0: shutdown
> [  598.021819][ T8290] pci 0000:c9:00.4: shutdown
> [  598.026911][ T8290] pci 0000:c9:00.2: shutdown
> [  598.032798][ T8290] pci 0000:c9:00.1: shutdown
> [  598.037981][ T8290] pci 0000:c9:00.0: shutdown
> [  598.043247][ T8290] pci 0000:b0:00.4: shutdown
> [  598.048160][ T8290] pci 0000:b0:00.2: shutdown
> [  598.053010][ T8290] pci 0000:b0:00.1: shutdown
> [  598.057972][ T8290] pci 0000:b0:00.0: shutdown
> [  598.063237][ T8290] pci 0000:97:00.4: shutdown
> [  598.068403][ T8290] pci 0000:97:00.2: shutdown
> [  598.073666][ T8290] pci 0000:97:00.1: shutdown
> [  598.078549][ T8290] pci 0000:97:00.0: shutdown
> [  598.083407][ T8290] pci 0000:80:02.4: shutdown
> [  598.088245][ T8290] pci 0000:80:02.1: shutdown
> [  598.093198][ T8290] pci 0000:80:02.0: shutdown
> [  598.098413][ T8290] ioatdma 0000:80:01.7: shutdown
> [  598.103844][ T8290] ioatdma 0000:80:01.6: shutdown
> [  598.109433][ T8290] ioatdma 0000:80:01.5: shutdown
> [  598.114706][ T8290] ioatdma 0000:80:01.4: shutdown
> [  598.119944][ T8290] ioatdma 0000:80:01.3: shutdown
> [  598.125160][ T8290] ioatdma 0000:80:01.2: shutdown
> [  598.130670][ T8290] ioatdma 0000:80:01.1: shutdown
> [  598.135971][ T8290] ioatdma 0000:80:01.0: shutdown
> [  598.141442][ T8290] pci 0000:80:00.4: shutdown
> [  598.146280][ T8290] pci 0000:80:00.2: shutdown
> [  598.151087][ T8290] pci 0000:80:00.1: shutdown
> [  598.155967][ T8290] pci 0000:80:00.0: shutdown
> [  598.161536][ T8290] pci 0000:7f:1e.7: shutdown
> [  598.166567][ T8290] pci 0000:7f:1e.6: shutdown
> [  598.171602][ T8290] pci 0000:7f:1e.5: shutdown
> [  598.176490][ T8290] pci 0000:7f:1e.4: shutdown
> [  598.181531][ T8290] pci 0000:7f:1e.3: shutdown
> [  598.186385][ T8290] pci 0000:7f:1e.2: shutdown
> [  598.191404][ T8290] pci 0000:7f:1e.1: shutdown
> [  598.196239][ T8290] pci 0000:7f:1e.0: shutdown
> [  598.201217][ T8290] pci 0000:7f:1d.1: shutdown
> [  598.206053][ T8290] pci 0000:7f:1d.0: shutdown
> [  598.211008][ T8290] pci 0000:7f:0e.7: shutdown
> [  598.215946][ T8290] pci 0000:7f:0e.6: shutdown
> [  598.220960][ T8290] pci 0000:7f:0e.5: shutdown
> [  598.225970][ T8290] pci 0000:7f:0e.4: shutdown
> [  598.230966][ T8290] pci 0000:7f:0e.3: shutdown
> [  598.235991][ T8290] pci 0000:7f:0e.2: shutdown
> [  598.240974][ T8290] pci 0000:7f:0e.1: shutdown
> [  598.245971][ T8290] pci 0000:7f:0e.0: shutdown
> [  598.250945][ T8290] pci 0000:7f:0d.7: shutdown
> [  598.255948][ T8290] pci 0000:7f:0d.6: shutdown
> [  598.260908][ T8290] pci 0000:7f:0d.5: shutdown
> [  598.265880][ T8290] pci 0000:7f:0d.4: shutdown
> [  598.270862][ T8290] pci 0000:7f:0d.3: shutdown
> [  598.275922][ T8290] pci 0000:7f:0d.2: shutdown
> [  598.280900][ T8290] pci 0000:7f:0d.1: shutdown
> [  598.285877][ T8290] pci 0000:7f:0d.0: shutdown
> [  598.290839][ T8290] pci 0000:7f:0c.7: shutdown
> [  598.295800][ T8290] pci 0000:7f:0c.6: shutdown
> [  598.300665][ T8290] pci 0000:7f:0c.5: shutdown
> [  598.305621][ T8290] pci 0000:7f:0c.4: shutdown
> [  598.310422][ T8290] pci 0000:7f:0c.3: shutdown
> [  598.315368][ T8290] pci 0000:7f:0c.2: shutdown
> [  598.320169][ T8290] pci 0000:7f:0c.1: shutdown
> [  598.325137][ T8290] pci 0000:7f:0c.0: shutdown
> [  598.329922][ T8290] pci 0000:7f:0b.7: shutdown
> [  598.334840][ T8290] pci 0000:7f:0b.6: shutdown
> [  598.339612][ T8290] pci 0000:7f:0b.5: shutdown
> [  598.344503][ T8290] pci 0000:7f:0b.4: shutdown
> [  598.349285][ T8290] pci 0000:7f:0b.3: shutdown
> [  598.354213][ T8290] pci 0000:7f:0b.2: shutdown
> [  598.359009][ T8290] pci 0000:7f:0b.1: shutdown
> [  598.364201][ T8290] pci 0000:7f:0b.0: shutdown
> [  598.369137][ T8290] pci 0000:7f:0a.7: shutdown
> [  598.374128][ T8290] pci 0000:7f:0a.6: shutdown
> [  598.379000][ T8290] pci 0000:7f:0a.5: shutdown
> [  598.383893][ T8290] pci 0000:7f:0a.4: shutdown
> [  598.388671][ T8290] pci 0000:7f:0a.3: shutdown
> [  598.393570][ T8290] pci 0000:7f:0a.2: shutdown
> [  598.398348][ T8290] pci 0000:7f:0a.1: shutdown
> [  598.403261][ T8290] pci 0000:7f:0a.0: shutdown
> [  598.408029][ T8290] pci 0000:7f:04.7: shutdown
> [  598.412921][ T8290] pci 0000:7f:04.6: shutdown
> [  598.417700][ T8290] pci 0000:7f:04.5: shutdown
> [  598.422591][ T8290] pci 0000:7f:04.4: shutdown
> [  598.427360][ T8290] pci 0000:7f:04.3: shutdown
> [  598.432273][ T8290] pci 0000:7f:04.2: shutdown
> [  598.437127][ T8290] pci 0000:7f:04.1: shutdown
> [  598.442041][ T8290] pci 0000:7f:04.0: shutdown
> [  598.446817][ T8290] pci 0000:7f:03.7: shutdown
> [  598.451701][ T8290] pci 0000:7f:03.6: shutdown
> [  598.456484][ T8290] pci 0000:7f:03.5: shutdown
> [  598.461408][ T8290] pci 0000:7f:03.4: shutdown
> [  598.466182][ T8290] pci 0000:7f:03.3: shutdown
> [  598.471075][ T8290] pci 0000:7f:03.2: shutdown
> [  598.475961][ T8290] pci 0000:7f:03.1: shutdown
> [  598.480857][ T8290] pci 0000:7f:03.0: shutdown
> [  598.485785][ T8290] pci 0000:7f:02.7: shutdown
> [  598.490704][ T8290] pci 0000:7f:02.6: shutdown
> [  598.495637][ T8290] pci 0000:7f:02.5: shutdown
> [  598.500583][ T8290] pci 0000:7f:02.4: shutdown
> [  598.505472][ T8290] pci 0000:7f:02.3: shutdown
> [  598.510380][ T8290] pci 0000:7f:02.2: shutdown
> [  598.515158][ T8290] pci 0000:7f:02.1: shutdown
> [  598.520076][ T8290] pci 0000:7f:02.0: shutdown
> [  598.524843][ T8290] pci 0000:7f:01.7: shutdown
> [  598.529736][ T8290] pci 0000:7f:01.6: shutdown
> [  598.534519][ T8290] pci 0000:7f:01.5: shutdown
> [  598.539423][ T8290] pci 0000:7f:01.4: shutdown
> [  598.544194][ T8290] pci 0000:7f:01.3: shutdown
> [  598.549111][ T8290] pci 0000:7f:01.2: shutdown
> [  598.553878][ T8290] pci 0000:7f:01.1: shutdown
> [  598.559194][ T8290] pci 0000:7f:01.0: shutdown
> [  598.564024][ T8290] pci 0000:7f:00.7: shutdown
> [  598.568938][ T8290] pci 0000:7f:00.6: shutdown
> [  598.573702][ T8290] pci 0000:7f:00.5: shutdown
> [  598.578350][ T8290] pci 0000:7f:00.4: shutdown
> [  598.583000][ T8290] pci 0000:7f:00.3: shutdown
> [  598.587725][ T8290] pci 0000:7f:00.2: shutdown
> [  598.592616][ T8290] pci 0000:7f:00.1: shutdown
> [  598.597394][ T8290] pci 0000:7f:00.0: shutdown
> [  598.602307][ T8290] pci 0000:7e:1d.0: shutdown
> [  598.607019][ T8290] pci 0000:7e:1c.0: shutdown
> [  598.611684][ T8290] pci 0000:7e:1b.0: shutdown
> [  598.616363][ T8290] pci 0000:7e:1a.0: shutdown
> [  598.621082][ T8290] icx_uncore 0000:7e:0f.0: shutdown
> [  598.626614][ T8290] icx_uncore 0000:7e:0e.0: shutdown
> [  598.632208][ T8290] icx_uncore 0000:7e:0d.0: shutdown
> [  598.637760][ T8290] icx_uncore 0000:7e:0c.0: shutdown
> [  598.643132][ T8290] pci 0000:7e:0b.2: shutdown
> [  598.647832][ T8290] pci 0000:7e:0b.1: shutdown
> [  598.652593][ T8290] pci 0000:7e:0b.0: shutdown
> [  598.657531][ T8290] pci 0000:7e:07.2: shutdown
> [  598.662334][ T8290] icx_uncore 0000:7e:07.1: shutdown
> [  598.667887][ T8290] pci 0000:7e:07.0: shutdown
> [  598.672722][ T8290] pci 0000:7e:06.2: shutdown
> [  598.677693][ T8290] icx_uncore 0000:7e:06.1: shutdown
> [  598.683201][ T8290] pci 0000:7e:06.0: shutdown
> [  598.688283][ T8290] pci 0000:7e:05.2: shutdown
> [  598.693421][ T8290] icx_uncore 0000:7e:05.1: shutdown
> [  598.699081][ T8290] pci 0000:7e:05.0: shutdown
> [  598.704185][ T8290] pci 0000:7e:04.3: shutdown
> [  598.709291][ T8290] pci 0000:7e:04.2: shutdown
> [  598.714434][ T8290] icx_uncore 0000:7e:04.1: shutdown
> [  598.720160][ T8290] pci 0000:7e:04.0: shutdown
> [  598.725341][ T8290] pci 0000:7e:03.2: shutdown
> [  598.730376][ T8290] icx_uncore 0000:7e:03.1: shutdown
> [  598.736145][ T8290] pci 0000:7e:03.0: shutdown
> [  598.741216][ T8290] pci 0000:7e:02.2: shutdown
> [  598.746417][ T8290] icx_uncore 0000:7e:02.1: shutdown
> [  598.752296][ T8290] pci 0000:7e:02.0: shutdown
> [  598.757541][ T8290] pci 0000:7e:00.5: shutdown
> [  598.762781][ T8290] pci 0000:7e:00.3: shutdown
> [  598.767979][ T8290] pci 0000:7e:00.2: shutdown
> [  598.773227][ T8290] pci 0000:7e:00.1: shutdown
> [  598.778442][ T8290] pci 0000:7e:00.0: shutdown
> [  598.783712][ T8290] pcieport 0000:64:05.0: shutdown
> [  598.790605][ T8290] pcieport 0000:64:04.0: shutdown
> [  598.798827][ T8290] pcieport 0000:64:03.0: shutdown
> [  598.806858][ T8290] pcieport 0000:64:02.0: shutdown
> [  598.818067][ T8290] pci 0000:64:00.4: shutdown
> [  598.825157][ T8290] pci 0000:64:00.2: shutdown
> [  598.831142][ T8290] pci 0000:64:00.1: shutdown
> [  598.838114][ T8290] pci 0000:64:00.0: shutdown
> [  598.843365][ T8290] pci 0000:4a:00.4: shutdown
> [  598.848354][ T8290] pci 0000:4a:00.2: shutdown
> [  598.853581][ T8290] pci 0000:4a:00.1: shutdown
> [  598.858707][ T8290] pci 0000:4a:00.0: shutdown
> [  598.863946][ T8290] pci 0000:30:00.4: shutdown
> [  598.869238][ T8290] pci 0000:30:00.2: shutdown
> [  598.874523][ T8290] pci 0000:30:00.1: shutdown
> [  598.879798][ T8290] pci 0000:30:00.0: shutdown
> [  598.885065][ T8290] i40e 0000:17:00.1: shutdown
> [  598.976401][ T8290] i40e 0000:17:00.0: shutdown
> [  599.074539][ T8290] pcieport 0000:16:04.0: shutdown
> [  599.086110][ T8290] pci 0000:16:00.4: shutdown
> [  599.090890][ T8290] pci 0000:16:00.2: shutdown
> [  599.095597][ T8290] pci 0000:16:00.1: shutdown
> [  599.100325][ T8290] pci 0000:16:00.0: shutdown
> [  599.105033][ T8290] ipmi_si IPI0001:00: shutdown
> [  599.109898][ T8290] platform PNP0103:00: shutdown
> [  599.114851][ T8290] platform PNP0800:00: shutdown
> [  599.119845][ T8290] platform PNP0C04:00: shutdown
> [  599.124844][ T8290] platform PNP0003:00: shutdown
> [  599.129861][ T8290] ast 0000:02:00.0: shutdown
> [  599.134596][ T8290] pci 0000:01:00.0: shutdown
> [  599.139344][ T8290] pci 0000:00:1f.5: shutdown
> [  599.144081][ T8290] i801_smbus 0000:00:1f.4: shutdown
> [  599.149663][ T8290] pci 0000:00:1f.2: shutdown
> [  599.154407][ T8290] pci 0000:00:1f.0: shutdown
> [  599.159149][ T8290] pcieport 0000:00:1c.0: shutdown
> [  599.164737][ T8290] ahci 0000:00:17.0: shutdown
> [  599.169902][ T8290] pci 0000:00:16.4: shutdown
> [  599.174660][ T8290] pci 0000:00:16.1: shutdown
> [  599.179382][ T8290] pci 0000:00:16.0: shutdown
> [  599.184144][ T8290] intel_pch_thermal 0000:00:14.2: shutdown
> [  599.190113][ T8290] xhci_hcd 0000:00:14.0: shutdown
> [  599.198703][ T8290] pci 0000:00:11.1: shutdown
> [  599.203464][ T8290] pci 0000:00:11.0: shutdown
> [  599.209448][ T8290] pci 0000:00:02.4: shutdown
> [  599.214360][ T8290] pci 0000:00:02.1: shutdown
> [  599.219605][ T8290] pci 0000:00:02.0: shutdown
> [  599.224342][ T8290] ioatdma 0000:00:01.7: shutdown
> [  599.229465][ T8290] ioatdma 0000:00:01.6: shutdown
> [  599.234514][ T8290] ioatdma 0000:00:01.5: shutdown
> [  599.239623][ T8290] ioatdma 0000:00:01.4: shutdown
> [  599.244763][ T8290] ioatdma 0000:00:01.3: shutdown
> [  599.249925][ T8290] ioatdma 0000:00:01.2: shutdown
> [  599.255035][ T8290] ioatdma 0000:00:01.1: shutdown
> [  599.260112][ T8290] ioatdma 0000:00:01.0: shutdown
> [  599.265154][ T8290] pci 0000:00:00.4: shutdown
> [  599.269857][ T8290] pci 0000:00:00.2: shutdown
> [  599.274592][ T8290] pci 0000:00:00.1: shutdown
> [  599.279359][ T8290] pci 0000:00:00.0: shutdown
> [  599.284151][ T8290] platform acpi-cpufreq: shutdown
> [  599.290252][ T8290] GHES GHES.1: shutdown
> [  599.294547][ T8290] GHES GHES.0: shutdown
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
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
