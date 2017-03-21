Content-Type: multipart/mixed; boundary="===============1379971691856336771=="
MIME-Version: 1.0
From: Chen Yu <yu.c.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ACPI throttling] c31aef80be: kmsg.ACPI:HARDWARE_addr_space, NOT_supported_yet
Date: Tue, 21 Mar 2017 13:21:05 +0800
Message-ID: <63090028-444f-b9c8-8cab-ae9f0b36e39b@intel.com>
In-Reply-To: <20170321045533.GC23490@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1379971691856336771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,
Thanks for notification, yes, this is because it is running on a virtual =

machine,
this patch will invoke a function which is only valid for =

X86_VENDOR_INTEL and
has X86_FEATURE_ACPI, so for kvm guest this requirement is not met and
will print a warning and return immediately without impact the kvm guest =

system.

thanks,
Yu
On 2017=E5=B9=B403=E6=9C=8821=E6=97=A5 12:55, kernel test robot wrote:
> Hi, yu
>
> Is this error log due to running the test on a virtual machine?
>
> -------------------------------------------------------------------------=
-----
> FYI, we noticed the following commit:
>
> commit: c31aef80be87cb7f51390e03df826fa51662056a ("ACPI throttling: Disab=
le the MSR T-state if enabled after resumed")
> git://bee.sh.intel.com/git/power/linux.git yu
>
> in testcase: pm-qa
> with following parameters:
>
> 	test: cpuidle
>
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 5G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> [  503.866511] kvm-clock: cpu 1, msr 1:7ff52041, secondary cpu clock
> [  503.871771] masked ExtINT on CPU#1
> [  503.896289] KVM setup async PF for cpu 1
> [  503.900391] kvm-stealtime: cpu 1, msr 17fc8d900
> [  503.909834] ACPI: HARDWARE addr space,NOT supported yet
> [  503.926418] smpboot: Booting Node 0 Processor 2 APIC 0x2
> [  503.941171] kvm-clock: cpu 2, msr 1:7ff52081, secondary cpu clock
> [  503.947758] masked ExtINT on CPU#2
> [  503.973667] KVM setup async PF for cpu 2
> [  503.979348] kvm-stealtime: cpu 2, msr 17fd0d900
> [  503.987555] ACPI: HARDWARE addr space,NOT supported yet
> [  503.997248] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [  504.006147] kvm-clock: cpu 3, msr 1:7ff520c1, secondary cpu clock
> [  504.013636] masked ExtINT on CPU#3
> [  504.039351] KVM setup async PF for cpu 3
> [  504.046479] kvm-stealtime: cpu 3, msr 17fd8d900
> [  504.062164] ACPI: HARDWARE addr space,NOT supported yet
> [  504.122643]
>
>
>
> To reproduce:
>
>          git clone https://github.com/01org/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script  # job-script is attached i=
n this email
>
>
>
> Thanks,
> Xiaolong


--===============1379971691856336771==--

